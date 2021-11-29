class MatchesController < ApplicationController

  def index
    if params[:query].present?
      @matches = Match.where("location ILIKE ?", "%#{params[:query]}%")
    else
      @matches = Match.upcoming.order(:start_at)
    end
    @matches_by_date = @matches.group_by do |match|
      match.start_at.to_date
    end
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @match.user = current_user
    if @match.save
      @match_user = MatchUser.new(team: "A")
      @match_user.user = current_user
      @match_user.match = @match
      @match_user.save
      redirect_to matches_path
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
    @match_user = MatchUser.new
    @already_joined = @match.match_users.where({user: current_user}).exists?
  end

  private

  def match_params
    params.require(:match).permit(:location, :start_at, :max_players)
  end
end

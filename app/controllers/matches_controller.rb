class MatchesController < ApplicationController

  def index
    @matches = policy_scope(Match.where(private_match: false).upcoming.order(:start_at))
    if params[:query].present?
      @matches = @matches.where("location ILIKE ?", "%#{params[:query]}%")
    end
    @matches_by_date = @matches.group_by do |match|
      match.start_at.to_date
    end
  end

  def new
    @challenged_club = Club.find(params[:challenged_club_id]) if params[:challenged_club_id]
    @match = Match.new
    authorize @match
  end

  def create
    @challenged_club = Club.find(params[:challenged_club_id]) if params[:challenged_club_id]
    @match = Match.new(match_params)
    @match.user = current_user

    if @challenged_club
      @challenge = Challenge.new(
        challenged_club: @challenged_club,
        challenging_club: current_user.owned_club,
        status: "pending"
      )
      @match.challenge = @challenge
    end

    if @match.save
      unless @challenge
        @match_user = MatchUser.new(team: "A")
        @match_user.user = current_user
        @match_user.match = @match
        @match_user.save
      end

      redirect_to matches_path
    else
      render :new
    end
    authorize @match
  end

  def update
    @challenged_club = Club.find(params[:challenged_club_id])
    @choice = params[:choice]
    @challenge = Challenge.find(params[:id])
    @challenge.update(status: @choice)
    redirect_to club_path(@challenged_club.id)
  end

  def show
    @match = Match.find(params[:id])
    @match_user = MatchUser.new
    @already_joined = @match.match_users.where({user: current_user}).exists?
    authorize @match
  end

  private

  def match_params
    params.require(:match).permit(:private_match, :location, :start_at, :max_players)
  end
end

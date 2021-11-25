class MatchesController < ApplicationController

  def index
    @matches = Match.upcoming.order(:start_at)
    @matches_by_date = @matches.group_by do |match|
      match.start_at.to_date
    end
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path
    else
      render :new
    end

  end

  private

  def match_params
    params.require(:match).permit(:location, :start_at, :max_players)
  end

  def show
    @match = Match.find(params[:id])
  end
end

class TournamentMatchesController < ApplicationController

  def show
    @tournament_match = TournamentMatch.find(params[:id])
    authorize @tournament_match
  end

  def update
    @tournament_match = TournamentMatch.find(params[:id])
    
    authorize @tournament_match
  end

end

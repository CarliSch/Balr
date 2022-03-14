class TournamentKnockoutsController < ApplicationController

  def show
    @tournament_knockout = TournamentKnockout.find(params[:id])
    authorize @tournament_knockout
  end

  def index
    @tournament_knockouts = policy_scope(TournamentKnockout.all)
    authorize @tournament_knockouts
  end
end

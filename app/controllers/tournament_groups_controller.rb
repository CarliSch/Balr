class TournamentGroupsController < ApplicationController

  def show
    @tournament_group = TournamentGroup.find(params[:id])
    authorize @tournament_group
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end

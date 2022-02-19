class TournamentGroupsController < ApplicationController
  before_action :set_tournament, only: [:index]
  def show
    @tournament_group = TournamentGroup.find(params[:id])
    authorize @tournament_group
  end

  def index
    @tournament_groups = policy_scope(@tournament.tournament_groups)
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end

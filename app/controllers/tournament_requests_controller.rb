class TournamentRequestsController < ApplicationController
  before_action :set_tournament, only: [:create]

  def create
    @club = current_user.club
    @tournament_request = TournamentRequest.create(club_id: @club.id, tournament_id: @tournament.id)
    redirect_to tournament_path(@tournament)
    authorize @tournament_request
  end


  def update
    @choice = params[:choice]
    @tournament_request = TournamentRequest.find(params[:id])
    @tournament_request.update(status: @choice)
    redirect_to creator_tournament_path(@tournament_request.tournament)
    authorize @tournament_request
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end

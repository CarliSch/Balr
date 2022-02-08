class TournamentsController < ApplicationController
    before_action :set_tournament, only: [:show]

  def new
    @creator = Creator.find(params[:creator_id])
    @tournament = Tournament.new
    authorize @tournament
  end

  def create
    @tournament = Tournament.new(strong_params)
    @creator = Creator.find(params[:creator_id])
    @tournament.creator = @creator
    if @tournament.save
      redirect_to [@creator, @tournament]
     else
       render :new
   end
     authorize @tournament
  end

  def show
    @existing_request_from_club = @tournament.pending_tournament_request
    @pending_tournament_requests = @tournament.tournament_requests.pending
    authorize @tournament
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def strong_params
    params.require(:tournament).permit(:name, :description, :start_at, :rules, :age_group, :skill_level)
  end
end

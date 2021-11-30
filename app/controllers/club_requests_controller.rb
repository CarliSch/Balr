class ClubRequestsController < ApplicationController
  def create
    @club = Club.find(params[:club_id])
    @club_request = ClubRequest.create(user: current_user, club: @club, status: "pending")
    redirect_to clubs_path
  end
end

class ClubRequestsController < ApplicationController
  def create
    @club = Club.find(params[:club_id])
    @club_request = ClubRequest.create(user_id: current_user.id, club_id: @club.id)
    redirect_to club_path(@club)
  end

  def update
    @choice = params[:choice]
    @club_request = ClubRequest.find(params[:id])
    @club_request.update(status: @choice)
    redirect_to club_path(@club_request.club)
  end
end

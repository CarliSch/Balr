class ClubsController < ApplicationController
  def index
    @clubs = Club.where.not(user: current_user)
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user
    if @club.save
      ClubRequest.create(user: @club.user, club: @club, status: "accepted")
      redirect_to clubs_path
    else
      render :new
    end
  end

  def show
    @club = Club.find(params[:id])
    @existing_request_from_current_user = @club.club_requests.where(user: current_user).exists?
    @pending_club_requests = @club.club_requests.where(status: "pending")
  end

  private

  def club_params
    params.require(:club).permit(:name, :photo)
  end

end

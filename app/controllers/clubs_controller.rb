class ClubsController < ApplicationController
  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
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

  private

  def club_params
    params.require(:club).permit(:name, :photo)
  end
end

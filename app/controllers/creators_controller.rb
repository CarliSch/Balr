class CreatorsController < ApplicationController

  def show
    @creator = Creator.find(params[:id])
  end

  def new
    @creator = Creator.new
    authorize @creator
  end

  def create
    @creator = Creator.new(creator_params)
    @creator.user.admin = current_user
    @creator.save
    authorize @creator
  end

  private

  def creator_params
    params.require(:creator).permit(:name, :description)
  end
end

class CreatorsController < ApplicationController

  def show
    @creator = Creator.find(params[:id])
    authorize @creator
  end

  def new
    @creator = Creator.new
    authorize @creator
  end

  def create
    @creator = Creator.new(creator_params)
    @creator.user = current_user
    redirect_to creators_path(params[:creator_id])
    @creator.save
    authorize @creator
  end

  private

  def creator_params
    params.require(:creator).permit(:name, :description)
  end
end

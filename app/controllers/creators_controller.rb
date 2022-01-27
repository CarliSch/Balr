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
    @creator = Creator.new(strong_params)
    @creator.user = current_user
    if @creator.save
      redirect_to @creator
    else
      render :new
    end
    authorize @creator
  end

  def index
    @creators = policy_scope(Creator.all)
    authorize @creators
  end

  private

  def strong_params
    params.require(:creator).permit(:name, :description, :location)
  end
end

class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:user_id])
  end
end

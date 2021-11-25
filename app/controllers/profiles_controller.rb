class ProfilesController < ApplicationController
  def show
    @profile = User.find(current_user[:id])
  end
end

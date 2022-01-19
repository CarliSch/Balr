class MatchUsersController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @match_user = MatchUser.create(user: current_user, team: params[:match_user][:team], match: @match)

    redirect_to match_path(@match)
    authorize @match_user
  end
end

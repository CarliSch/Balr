class HomeTeamsController < ApplicationController

  def update
    @home_team = HomeTeam.find(params[:id])
    @home_team.goals += 1
    @home_team.save!
    redirect_to tournament_group_tournament_match_path(@home_team.tournament_match.tournament_group, @home_team.tournament_match)
    authorize @home_team
  end

end

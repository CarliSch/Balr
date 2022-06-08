class HomeTeamsController < ApplicationController

  def show
    @home_team = HomeTeam.find(params[:id])
    @home_team.goals += 1
    @home_team.save!
    if @home_team.tournament_match.tournament_group.present?
      redirect_to tournament_group_tournament_match_path(@home_team.tournament_match.tournament_group, @home_team.tournament_match)
    else
      redirect_to tournament_knockout_tournament_match_path(@home_team.tournament_match.tournament_knockout, @home_team.tournament_match)
    end
    authorize @home_team
  end

end

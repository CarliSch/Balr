class AwayTeamsController < ApplicationController

  def update
    @away_team = AwayTeam.find(params[:id])
    @away_team.goals += 1
    @away_team.save!
    redirect_to tournament_group_tournament_match_path(@away_team.tournament_match.tournament_group, @away_team.tournament_match)
    authorize @away_team
  end
end

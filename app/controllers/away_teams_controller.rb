class AwayTeamsController < ApplicationController

  def show
    @away_team = AwayTeam.find(params[:id])
    @away_team.goals += 1
    @away_team.save!
    if @away_team.tournament_match.tournament_group.present?
      redirect_to tournament_group_tournament_match_path(@away_team.tournament_match.tournament_group, @away_team.tournament_match)
    else
      redirect_to tournament_knockout_tournament_match_path(@away_team.tournament_match.tournament_knockout, @away_team.tournament_match)
    end
    authorize @away_team
  end
end

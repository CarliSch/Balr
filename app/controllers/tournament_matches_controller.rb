class TournamentMatchesController < ApplicationController

  def show
    @tournament_match = TournamentMatch.find(params[:id])
    @home_team = @tournament_match.home_team
    @away_team = @tournament_match.away_team
    authorize @tournament_match
  end

  def update
    @tournament_match = TournamentMatch.find(params[:id])
    @home_team = @tournament_match.home_team
    @away_team = @tournament_match.away_team

    if @home_team.goals > @away_team.goals
      @home_team.tournament_club.update!(points: @home_team.tournament_club.points += 3)
    elsif @home_team.goals < @away_team.goals
      @away_team.tournament_club.update!(points: @away_team.tournament_club.points += 3)
    else
      @away_team.tournament_club.update!(points: @away_team.tournament_club.points += 1)
      @home_team.tournament_club.update!(points: @home_team.tournament_club.points += 1)
    end
    redirect_to tournament_group_tournament_match_path(@tournament_match.tournament_group, @tournament_match)
    @tournament_match.save!
    authorize @tournament_match
  end

end

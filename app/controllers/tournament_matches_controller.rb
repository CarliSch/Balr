class TournamentMatchesController < ApplicationController

  def show
    @tournament_match = TournamentMatch.find(params[:id])
    @home_team = @tournament_match.home_team
    @away_team = @tournament_match.away_team
    authorize @tournament_match
  end


  #When adjusting to make the code fit different tournamnet sizes, use a case @tournament that take while @tournament.amount_of_teams
  def update
    @tournament_match = TournamentMatch.find(params[:id])
    @home_team = @tournament_match.home_team
    @away_team = @tournament_match.away_team
    @tournament_group = @tournament_match.tournament_group
    if @home_team.goals > @away_team.goals
      @home_team.tournament_club.update!(points: @home_team.tournament_club.points += 3)
    elsif @home_team.goals < @away_team.goals
      @away_team.tournament_club.update!(points: @away_team.tournament_club.points += 3)
    else
      @away_team.tournament_club.update!(points: @away_team.tournament_club.points += 1)
      @home_team.tournament_club.update!(points: @home_team.tournament_club.points += 1)
      @tournament_match.status = "finished"
    end
    if @tournament_match == @tournament_group.tournament_matches.last
      @tournament_knockout = tournament_knockout.create!(tournament_group: @tournament_group)
      @home_team = HomeTeam.create!(tournament_club: @tournament_group.first_place, goals: 0)
      @away_team = AwayTeam.create!(tournament_club: TournamentGroup.find(@tournament_group.id - 1).second_place, goals: 0)
      @tournament_match = TournamentMatch.create!(tournament_knockout: @tournament_knockout, home_team: @home_team, away_team: @away_team)
    end
    #create a update method that creates tournament knockouts if all group matches status are set to "finished"
    #change the schema so that tournament_clubs has reference to tournament_knockout with null: true
    redirect_to tournament_tournament_group_path(@tournament_match.tournament_group.tournament, @tournament_match.tournament_group)
    @tournament_match.save!
    authorize @tournament_match
  end

end

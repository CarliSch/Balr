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
    @tournament = @tournament_match.tournament

    #method for adding points to group table
    if @home_team.goals > @away_team.goals
      @home_team.tournament_club.update!(points: @home_team.tournament_club.points += 3)
      @tournament_match.update!(status: "finished")
    elsif @home_team.goals < @away_team.goals
      @away_team.tournament_club.update!(points: @away_team.tournament_club.points += 3)
      @tournament_match.update!(status: "finished")
    else
      @away_team.tournament_club.update!(points: @away_team.tournament_club.points += 1)
      @home_team.tournament_club.update!(points: @home_team.tournament_club.points += 1)
      @tournament_match.update!(status: "finished")
    end

    #adding a winner to knockout matches
    if @tournament_match.tournament_knockout.present?
      if @home_team.goals > @away_team.goals
        @tournament_match.update!(winner: @home_team.tournament_club.id)
        @tournament_match.update!(status: "finished")
      else
        @tournament_match.update!(winner: @away_team.tournament_club.id)
        @tournament_match.update!(status: "finished")
      end

      #creating a new stage of the tournament knockouts
      unless @tournament.tournament_knockouts.where(stage: "Semi-final").present? && @tournament.tournament_matches.where(status: "ongoing").present?
        @tournament_knockout = TournamentKnockout.create!(tournament: @tournament, stage: "Final")
        @home_team = HomeTeam.create!(tournament_club: TournamentClub.find(@tournament_match.winner), goals: 0)
        @away_team = AwayTeam.create!(tournament_club: TournamentClub.find(@tournament.tournament_matches[-2].winner), goals: 0)
        @tournament_match = TournamentMatch.create!(tournament_knockout: @tournament_knockout, tournament: @tournament, home_team: @home_team, away_team: @away_team)
      end
      redirect_to tournament_tournament_knockouts_path(@tournament, @tournament.tournament_knockouts)
    end
    if @tournament.tournament_knockouts.where(stage: "Final").present?
      @tournament.update!(tournament_winner: @tournament_match.winner)
    end
    #METHOD FOR CREATING TOURNAMENTKNOCKOUTS after tournament groups
    if TournamentMatch.where(status: "ongoing").present? == false && @tournament_match.tournament_group.present?
      @tournament_clubs1 = TournamentClub.where(tournament_group: @tournament.tournament_groups.first).order(points: :desc)
      @tournament_clubs2 = TournamentClub.where(tournament_group: @tournament.tournament_groups.last).order(points: :desc)
      n = 0
      c = 1
      2.times.map do
        @tournament_knockout = TournamentKnockout.create!(tournament: @tournament, stage: "Semi-final")
        @home_team = HomeTeam.create!(tournament_club: @tournament_clubs1[n], goals: 0)
        @away_team = AwayTeam.create!(tournament_club: @tournament_clubs2[c], goals: 0)
        @tournament_match = TournamentMatch.create!(tournament_knockout: @tournament_knockout, tournament: @tournament, home_team: @home_team, away_team: @away_team)
        n += 1
        c -= 1
      end
        redirect_to tournament_path(@tournament)
    end
    if @tournament_match.tournament_group.present?
      redirect_to tournament_tournament_group_path(@tournament, @tournament_match.tournament_group)
    end
    @tournament_match.save!
    authorize @tournament_match
  end

end

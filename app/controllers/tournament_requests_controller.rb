class TournamentRequestsController < ApplicationController
  before_action :set_tournament, only: [:create]

  def create
    @creator = @tournament.creator
    @club = current_user.club
    @tournament_request = TournamentRequest.create(club_id: @club.id, tournament_id: @tournament.id)
    redirect_to tournament_path(@tournament)
    authorize @tournament_request
  end

# Add a home_team model and away_team model with goals:integer

  def show
    @choice = params[:choice]
    @tournament_request = TournamentRequest.find(params[:id])
    @tournament_request.update(status: @choice)
    @tournament = @tournament_request.tournament
    #@tournament_group is set to the first instace of the @tournament groups
    @tournament_group = @tournament.tournament_groups.first
    @club = @tournament_request.club
    @amount_of_groups = @tournament.amount_of_teams / 4

    if @tournament.clubs.size == @tournament.amount_of_teams
      f = 0
      @amount_of_groups.times.map do
        4.times.map do
          TournamentClub.create!(club: @club, tournament_group: @tournament.tournament_groups[f], points: 0)
        end
        n = 1
        c = 2

        3.times.map do
          @home_team = HomeTeam.create!(tournament_club: @tournament.tournament_groups[f].tournament_clubs[0], goals: 0)
          @away_team = AwayTeam.create!(tournament_club: @tournament.tournament_groups[f].tournament_clubs[n], goals: 0)
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament.tournament_groups[f], tournament: @tournament, home_team: @home_team, away_team: @away_team)
          n += 1
        end

        2.times.map do
          @home_team = HomeTeam.create!(tournament_club: @tournament.tournament_groups[f].tournament_clubs[1], goals: 0)
          @away_team = AwayTeam.create!(tournament_club: @tournament.tournament_groups[f].tournament_clubs[c], goals: 0)
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament.tournament_groups[f], tournament: @tournament ,home_team: @home_team, away_team: @away_team)
          c += 1
        end
        @home_team = HomeTeam.create!(tournament_club: @tournament.tournament_groups[f].tournament_clubs[2], goals: 0)
        @away_team = AwayTeam.create!(tournament_club: @tournament.tournament_groups[f].tournament_clubs[3], goals: 0)
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament.tournament_groups[f], tournament: @tournament ,home_team: @home_team, away_team: @away_team)
        f += 1
      end
    end
    @tournament_group.save!
    redirect_to tournament_path(@tournament_request.tournament)
    authorize @tournament_request
  end

  private

  def set_tournament

    @tournament = Tournament.find(params[:tournament_id])
  end
end

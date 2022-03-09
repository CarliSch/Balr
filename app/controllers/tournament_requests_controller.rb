class TournamentRequestsController < ApplicationController
  before_action :set_tournament, only: [:create]

  def create
    @creator = @tournament.creator
    @club = current_user.club
    @tournament_request = TournamentRequest.create(club_id: @club.id, tournament_id: @tournament.id)
    redirect_to tournament_path(@tournament)
    authorize @tournament_request
  end


  def update
    @choice = params[:choice]
    @tournament_request = TournamentRequest.find(params[:id])
    @tournament_request.update(status: @choice)
    @tournament = @tournament_request.tournament
    @tournament_group = @tournament.tournament_groups.first
    @club = @tournament_request.club
    if @tournament_group.tournament_clubs.size == 3
      TournamentClub.create!(club: @club, tournament_group: @tournament_group, points: 0)
      n = 1
      c = 2
      3.times.map do
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, home_team: Club.find(@tournament_group.tournament_clubs[0].club.id), away_team: Club.find(@tournament_group.tournament_clubs[n].club.id))
        n += 1
      end
      2.times.map do
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, home_team: Club.find(@tournament_group.tournament_clubs[1].club.id), away_team: Club.find(@tournament_group.tournament_clubs[c].club.id))
        c += 1
      end
      @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, home_team: Club.find(@tournament_group.tournament_clubs[2].club.id), away_team: Club.find(@tournament_group.tournament_clubs[3].club.id))

    elsif @tournament_group.tournament_clubs.size == 4
      @tournament_group = TournamentGroup.find(@tournament_group.id + 1)
      TournamentClub.create!(club: @club, tournament_group: @tournament_group, points: 0)
      if @tournament_group.tournament_clubs.size == 4
        n = 1
        c = 2
        3.times.map do
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, home_team: Club.find(@tournament_group.tournament_clubs[0].club.id), away_team: Club.find(@tournament_group.tournament_clubs[n].club.id))
          n += 1
        end
        2.times.map do
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, home_team: Club.find(@tournament_group.tournament_clubs[1].club.id), away_team: Club.find(@tournament_group.tournament_clubs[c].club.id))
          c += 1
        end
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, home_team: Club.find(@tournament_group.tournament_clubs[2].club.id), away_team: Club.find(@tournament_group.tournament_clubs[3].club.id))
      end
    else
    TournamentClub.create!(club: @club, tournament_group: @tournament_group, points: 0)
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

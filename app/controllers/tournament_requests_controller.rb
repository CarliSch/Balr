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

  def update
    @choice = params[:choice]
    @tournament_request = TournamentRequest.find(params[:id])
    @tournament_request.update(status: @choice)
    @tournament = @tournament_request.tournament
    #@tournament_group is set to the first instace of the @tournament groups
    @tournament_group = @tournament.tournament_groups.first
    @club = @tournament_request.club
    #When the creator has accepted the first three teams
    if @tournament_group.tournament_clubs.size == 3
      #it creates the last tournamentclub, which is used to connect clubs with the tournament.
      #it is necessary because if i where to call clubs and add points, they would still remain
      #if they joined a new tournament
      TournamentClub.create!(club: @club, tournament_group: @tournament_group, points: 0)
      n = 1
      c = 2
      #each tournament_match has an hometeam and an awayteam, which has an instance of a tournament_club
      #the code below first creates a hometeam with index 0 and an awayteam with index 1. Then each times
      #it increases the index with 1 on the away team in order for matches to be created where all the clubs play eachother
      3.times.map do
        @home_team = HomeTeam.create!(tournament_club: @tournament_group.tournament_clubs[0], goals: 0)
        @away_team = AwayTeam.create!(tournament_club: @tournament_group.tournament_clubs[n], goals: 0)
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, tournament: @tournament, home_team: @home_team, away_team: @away_team)
        n += 1
      end
      #same principal here but now home_team starts as index 1 and only executes the code twice
      #because index 1 already is apart of a match with index 0
      2.times.map do
        @home_team = HomeTeam.create!(tournament_club: @tournament_group.tournament_clubs[1], goals: 0)
        @away_team = AwayTeam.create!(tournament_club: @tournament_group.tournament_clubs[c], goals: 0)
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, tournament: @tournament ,home_team: @home_team, away_team: @away_team)
        c += 1
      end
      #here the index 2 and index 3 plays eachother
      @home_team = HomeTeam.create!(tournament_club: @tournament_group.tournament_clubs[2], goals: 0)
      @away_team = AwayTeam.create!(tournament_club: @tournament_group.tournament_clubs[3], goals: 0)
      @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, tournament: @tournament ,home_team: @home_team, away_team: @away_team)


    #this code is for when the first group is full and there needs to be created a new group
    #it executes this code eveytime after the first group is full
    elsif @tournament_group.tournament_clubs.size >= 4
      @tournament_group = TournamentGroup.find(@tournament_group.id + 1)
      #here it creates a new instance of a tournament club and ads it to the new group
      TournamentClub.create!(club: @club, tournament_group: @tournament_group, points: 0)
      #when the new tournament_group is full, it executes the exact same code as in the first method
      if @tournament_group.tournament_clubs.size == 4
        n = 1
        c = 2
        3.times.map do
          @home_team = HomeTeam.create!(tournament_club: @tournament_group.tournament_clubs[0], goals: 0)
          @away_team = AwayTeam.create!(tournament_club: @tournament_group.tournament_clubs[n], goals: 0)
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, tournament: @tournament ,home_team: @home_team, away_team: @away_team)
          n += 1
        end
        2.times.map do
          @home_team = HomeTeam.create!(tournament_club: @tournament_group.tournament_clubs[1], goals: 0)
          @away_team = AwayTeam.create!(tournament_club: @tournament_group.tournament_clubs[c], goals: 0)
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, tournament: @tournament ,home_team: @home_team, away_team: @away_team)
          c += 1
        end
        @home_team = HomeTeam.create!(tournament_club: @tournament_group.tournament_clubs[2], goals: 0)
        @away_team = AwayTeam.create!(tournament_club: @tournament_group.tournament_clubs[3], goals: 0)
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, tournament: @tournament ,home_team: @home_team, away_team: @away_team)
      end
    else
      #this is when the first tournament group is not full and it just creates tournament_clubs and ads them to the group
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

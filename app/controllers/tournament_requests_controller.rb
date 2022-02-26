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
    if @tournament_group.bracket.size == 4
      6.times.map do
        @teams = 2.times.map { @tournament_group.bracket.sample }
      end
        unless @teams[0] != @teams[1]
          @teams = 2.times.map { @tournament_group.bracket.sample }
        else
          @tournament_match = TournamentMatch.create!(tournament_group: @tournament_group, versus: @teams)
        end
        @tournament_group = TournamentGroup.find(@tournament_group.id + 1)
        @tournament_group.bracket << @club.id
    elsif @tournament.tournament_groups.last.bracket.size == 3
      @tournament.tournament_groups.last.bracket << @club.id
      6.times.map do
        @teams = 2.times.map { @tournament.tournament_groups.last.bracket.sample }
      end
      unless @teams[0] != @teams[1]
        @teams = 2.times.map { @tournament.tournament_groups.last.bracket.sample }
      else
        @tournament_match = TournamentMatch.create!(tournament_group: @tournament.tournament_groups.last, versus: @teams)
      end
    else
      @tournament_group.bracket << @club.id
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

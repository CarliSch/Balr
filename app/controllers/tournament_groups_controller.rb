class TournamentGroupsController < ApplicationController

  def update
    @tournament_group = TournamentGroup.find(params[:tournament_group_id])
    @tournament = @tournament_group.tournament
    @teams = @tournament.teams.to_a
    @group = @tournament_group.group
    if @group.size < 4
      @teams.each do |team|
        @group << team
        @tournament_group.update(group: @group)
      end
    end
    authorize @tournament_group
  end

  def show
    @tournament_group = TournamentGroup.find(params[:id])
    authorize @tournament_group
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end

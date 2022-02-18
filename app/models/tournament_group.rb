class TournamentGroup < ApplicationRecord

  require "round_robin_tournament"

  belongs_to :tournament
  has_many :tournament_matches

  def teams
    Club.find(TournamentGroup.find(self.id).bracket)
  end

  def group_matches
    RoundRobinTournament.schedule(teams)
  end
end

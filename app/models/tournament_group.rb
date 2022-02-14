class TournamentGroup < ApplicationRecord

  require "round_robin_tournament"

  belongs_to :tournament
  has_many :tournament_matches


  def group_matches
    RoundRobinTournament.schedule(teams.to_a)
  end
end

class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  has_many :clubs, through: :tournament_groups

  def teams
    Club.find(TournamentMatch.find(self.id).versus)
  end
end

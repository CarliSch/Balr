class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches

  def teams
    Club.find(TournamentGroup.find(self.id).bracket)
  end

end

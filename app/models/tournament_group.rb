class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches
  has_many :tournament_clubs

  def standings
    @tournament_clubs ||= TournamentClub.where(tournament_group: self).order(points: :desc)

  end
end

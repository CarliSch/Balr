class TournamentGroup < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_matches
  has_many :tournament_clubs

  def standings
    @tournament_clubs ||= TournamentClub.where(tournament_group: self).order(points: :desc)
  end

  def first_place
    standings[0]
  end

  def second_place
    standings[1]
  end

  def knocked_out
    standings[2..-1]
  end
end

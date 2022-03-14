class TournamentKnockout < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_clubs
  has_many :tournament_matches
  validates :stage, inclusion: {in: ["Quarter-final", "Semi-final", "Final"]}
end

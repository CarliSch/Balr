class TournamentKnockout < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_clubs
end

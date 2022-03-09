class TournamentKnockout < ApplicationRecord
  belongs_to :tournament_group
  has_many :tournament_clubs
end

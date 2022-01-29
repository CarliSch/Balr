class TournamentMatch < ApplicationRecord
  belongs_to :tournament
  has_one :user
  has_many :club_tournament_matches
end

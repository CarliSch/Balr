class AwayTeam < ApplicationRecord
  belongs_to :tournament_club
  has_one :tournament_match
end

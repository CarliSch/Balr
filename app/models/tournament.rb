class Tournament < ApplicationRecord
  belongs_to :creator
  has_many :tournament_groups
  has_many :tournament_matches
  has_many :club_tournaments
end

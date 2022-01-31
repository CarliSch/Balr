class Tournament < ApplicationRecord
  belongs_to :creator
  has_many :tournament_groups
  has_many :tournament_matches
  has_many :clubs, through: :club_tournaments
  
end

class TournamentMatch < ApplicationRecord
  belongs_to :tournament_groups
  has_one :referee
  has_many :club, through: :club_tournament_matches

end

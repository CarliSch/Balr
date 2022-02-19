class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  has_many :club, through: :club_tournament_matches

end

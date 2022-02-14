class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :tournament_knockout
  has_many :club, through: :club_tournament_matches

end

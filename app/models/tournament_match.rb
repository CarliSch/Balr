class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :home_team
  belongs_to :away_team
  has_many :club_tournament_matches
  
end

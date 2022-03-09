class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :home_team
  belongs_to :away_team
  has_many :club_tournament_matches

  #Add a win or loss method
  #Add finished match that calls loser and winner
end

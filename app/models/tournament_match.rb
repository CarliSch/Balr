class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group, optional: true
  belongs_to :tournament
  belongs_to :tournament_knockout, optional: true
  belongs_to :home_team
  belongs_to :away_team
  has_many :club_tournament_matches

end

class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :home_team
  belongs_to :away_team
  has_many :club_tournament_matches

  def home_team_goals
    0
  end

  def away_team_goals
    0
  end
end

class TournamentMatch < ApplicationRecord
  belongs_to :tournament_group
  belongs_to :home_team, foreign_key: 'home_team_id', class_name: 'Club'
  belongs_to :away_team, foreign_key: 'away_team_id', class_name: 'Club'
  has_one :home_team_table
  has_one :away_team_table

end

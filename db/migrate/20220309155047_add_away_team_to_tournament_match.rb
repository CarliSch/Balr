class AddAwayTeamToTournamentMatch < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_matches, :away_team, null: false, foreign_key: true
  end
end

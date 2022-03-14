class AddTournamentGroupToTournamentMatch < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_matches, :tournament_group, null: true, foreign_key: true
  end
end

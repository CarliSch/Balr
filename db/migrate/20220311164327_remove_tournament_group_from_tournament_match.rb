class RemoveTournamentGroupFromTournamentMatch < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tournament_matches, :tournament_group, null: false, foreign_key: true
  end
end

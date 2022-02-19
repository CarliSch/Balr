class RemoveTournamentKnockoutFromTournamentMatch < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tournament_matches, :tournament_knockout, null: false, foreign_key: true
  end
end

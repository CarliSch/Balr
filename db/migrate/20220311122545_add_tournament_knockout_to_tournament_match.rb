class AddTournamentKnockoutToTournamentMatch < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_matches, :tournament_knockout, null: true, foreign_key: true
  end
end

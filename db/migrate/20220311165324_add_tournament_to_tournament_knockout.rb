class AddTournamentToTournamentKnockout < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_knockouts, :tournament, null: false, foreign_key: true
  end
end

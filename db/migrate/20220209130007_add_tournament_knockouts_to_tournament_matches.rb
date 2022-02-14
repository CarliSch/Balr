class AddTournamentKnockoutsToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_matches, :tournament_knockout, null: false, foreign_key: true
  end
end

class RemoveTournamentGroupFromTournamentKnockout < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tournament_knockouts, :tournament_group, null: false, foreign_key: true
  end
end

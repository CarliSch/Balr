class AddTournamentToTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_groups, :tournament, null: false, foreign_key: true
  end
end

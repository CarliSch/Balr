class AddVersusToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_matches, :versus, :integer, array: true, default: []
  end
end

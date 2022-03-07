class RemoveVersusFromTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_matches, :versus, :integer
  end
end

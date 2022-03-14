class AddStatusToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_matches, :status, :string, default: "ongoing"
  end
end

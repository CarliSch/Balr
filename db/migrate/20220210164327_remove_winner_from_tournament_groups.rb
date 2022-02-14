class RemoveWinnerFromTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_groups, :winner, :string
  end
end

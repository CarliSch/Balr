class RemoveSizeAndPlacementFromTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_groups, :size, :integer
    remove_column :tournament_groups, :placement, :integer
  end
end

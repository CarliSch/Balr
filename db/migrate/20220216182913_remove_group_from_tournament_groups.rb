class RemoveGroupFromTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_groups, :group, :text
  end
end

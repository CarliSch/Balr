class AddGroupToTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_groups, :group, :text, array: true, default: []
  end
end

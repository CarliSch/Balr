class AddBracketToTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_groups, :bracket, :integer, array: true, default: []
  end
end

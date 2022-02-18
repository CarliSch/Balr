class RemoveBracketFromTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_groups, :bracket, :string
  end
end

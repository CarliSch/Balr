class AddMaxPlayersToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :max_players, :integer
  end
end

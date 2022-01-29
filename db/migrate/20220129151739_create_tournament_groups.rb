class CreateTournamentGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_groups do |t|
      t.integer :winner
      t.integer :placement
      t.integer :size

      t.timestamps
    end
  end
end

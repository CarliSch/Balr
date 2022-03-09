class CreateHomeTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :home_teams do |t|
      t.integer :goals
      t.references :tournament_club, null: false, foreign_key: true

      t.timestamps
    end
  end
end

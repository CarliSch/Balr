class CreateTournamentClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_clubs do |t|
      t.integer :points
      t.references :tournament_group, null: false, foreign_key: true
      t.references :tournament_knockout
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end

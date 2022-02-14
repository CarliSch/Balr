class CreateTournamentKnockouts < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_knockouts do |t|
      t.string :winner
      t.references :tournament_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

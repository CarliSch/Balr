class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.datetime :start_at
      t.integer :amount_of_teams
      t.integer :amount_of_ko
      t.string :description
      t.string :name
      t.string :rules
      t.integer :age_group
      t.string :skill_level

      t.timestamps
    end
  end
end

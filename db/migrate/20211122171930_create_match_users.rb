class CreateMatchUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :match_users do |t|
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :club, null: true, foreign_key: true
      t.string :team

      t.timestamps
    end
  end
end

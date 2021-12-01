class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :status
      t.references :challenged_club
      t.references :challenging_club

      t.timestamps
    end
  end
end

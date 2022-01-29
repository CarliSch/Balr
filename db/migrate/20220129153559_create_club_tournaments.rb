class CreateClubTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :club_tournaments do |t|
      t.boolean :status

      t.timestamps
    end
  end
end

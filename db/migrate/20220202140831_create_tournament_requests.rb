class CreateTournamentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_requests do |t|
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end

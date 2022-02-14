class AddCreatorToTournamentRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_requests, :creator, null: false, foreign_key: true
  end
end

class AddTournamentToTournamentRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_requests, :tournament, null: false, foreign_key: true
  end
end

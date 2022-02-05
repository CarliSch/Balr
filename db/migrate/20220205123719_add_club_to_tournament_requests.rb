class AddClubToTournamentRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_requests, :club, null: false, foreign_key: true
  end
end

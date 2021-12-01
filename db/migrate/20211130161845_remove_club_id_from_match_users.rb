class RemoveClubIdFromMatchUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference :match_users, :club, foreign_key: true
  end
end

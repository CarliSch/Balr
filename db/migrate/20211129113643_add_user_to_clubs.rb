class AddUserToClubs < ActiveRecord::Migration[6.0]
  def change
    add_reference :clubs, :user, foreign_key: true
  end
end

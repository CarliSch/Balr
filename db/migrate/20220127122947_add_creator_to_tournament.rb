class AddCreatorToTournament < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournaments, :creator, null: false, foreign_key: true
  end
end

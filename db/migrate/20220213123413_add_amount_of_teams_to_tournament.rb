class AddAmountOfTeamsToTournament < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :amount_of_teams, :integer
  end
end

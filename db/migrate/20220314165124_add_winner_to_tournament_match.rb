class AddWinnerToTournamentMatch < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_matches, :winner, :integer
  end
end

class AddTournamentWinnerToTournament < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :tournament_winner, :integer, default: 0
  end
end

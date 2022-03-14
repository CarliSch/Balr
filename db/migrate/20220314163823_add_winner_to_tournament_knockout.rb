class AddWinnerToTournamentKnockout < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_knockouts, :winner, :integer, default: 0
  end
end

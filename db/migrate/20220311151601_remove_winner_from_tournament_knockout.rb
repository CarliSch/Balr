class RemoveWinnerFromTournamentKnockout < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_knockouts, :winner, :string
  end
end

class AddStageToTournamentKnockout < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_knockouts, :stage, :string
  end
end

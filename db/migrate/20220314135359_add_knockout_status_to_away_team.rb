class AddKnockoutStatusToAwayTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :away_teams, :knockout_status, :string, default: "playing"
  end
end

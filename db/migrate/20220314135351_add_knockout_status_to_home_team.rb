class AddKnockoutStatusToHomeTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :home_teams, :knockout_status, :string, default: "playing"
  end
end

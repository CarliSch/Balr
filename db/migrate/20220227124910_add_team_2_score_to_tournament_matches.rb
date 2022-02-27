class AddTeam2ScoreToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_matches, :team_2_score, :integer, default: 0
  end
end

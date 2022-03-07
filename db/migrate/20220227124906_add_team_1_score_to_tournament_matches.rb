class AddTeam1ScoreToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_matches, :team_1_score, :integer, default: 0
  end
end

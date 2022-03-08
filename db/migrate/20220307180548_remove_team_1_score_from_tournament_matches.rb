class RemoveTeam1ScoreFromTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_matches, :team_1_score, :integer
  end
end

class RemoveTeam2ScoreFromTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournament_matches, :team_2_score, :integer
  end
end

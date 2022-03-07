class RemoveAwayTeamFromTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    remove_reference :tournament_matches, :home_team, null: false, foreign_key: true
  end
end

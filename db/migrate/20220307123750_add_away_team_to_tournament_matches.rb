class AddAwayTeamToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_matches, :away_team
  end
end

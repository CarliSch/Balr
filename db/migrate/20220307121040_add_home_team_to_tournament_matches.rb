class AddHomeTeamToTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :tournament_matches, :home_team
  end
end

class CreateClubTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :club_tournament_matches do |t|

      t.timestamps
    end
  end
end

class CreateClubTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :club_tournament_matches do |t|
      t.references :tournament_club, null: false, foreign_key: true
      t.references :tournament_match, null: false, foreign_key: true

      t.timestamps
    end
  end
end

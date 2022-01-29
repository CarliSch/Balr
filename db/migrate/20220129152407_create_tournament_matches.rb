class CreateTournamentMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :tournament_matches do |t|
      t.string :location
      t.datetime :start_at

      t.timestamps
    end
  end
end

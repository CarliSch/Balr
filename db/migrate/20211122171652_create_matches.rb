class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :location
      t.datetime :start_at

      t.timestamps
    end
  end
end

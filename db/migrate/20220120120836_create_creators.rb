class CreateCreators < ActiveRecord::Migration[6.0]
  def change
    create_table :creators do |t|
      t.string :name
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end

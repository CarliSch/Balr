class AddColumnsToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :private_match, :boolean, default: false
    add_reference :matches, :challenge, null: true, foreign_key: true
  end
end

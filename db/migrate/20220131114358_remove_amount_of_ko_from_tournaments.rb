class RemoveAmountOfKoFromTournaments < ActiveRecord::Migration[6.0]
  def change
    remove_column :tournaments, :amount_of_ko, :integer
  end
end

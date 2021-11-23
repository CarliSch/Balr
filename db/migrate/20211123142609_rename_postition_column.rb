class RenamePostitionColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :postition, :position
  end
end

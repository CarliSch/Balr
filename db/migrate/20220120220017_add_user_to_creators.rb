class AddUserToCreators < ActiveRecord::Migration[6.0]
  def change
    add_reference :creators, :user, null: false, foreign_key: true
  end
end

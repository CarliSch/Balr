class ChangeColumnAgeToDateOfBirth < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :age, :integer
    dd_column :users, :birthday, :date
  end
end

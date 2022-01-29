class CreateRefereeRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :referee_requests do |t|

      t.timestamps
    end
  end
end

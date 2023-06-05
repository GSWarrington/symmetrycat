class RemoveUseridFromObservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :observations, :user_id, :integer
  end
end

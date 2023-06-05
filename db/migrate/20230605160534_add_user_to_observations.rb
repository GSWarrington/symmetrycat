class AddUserToObservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :observations, :user, null: false, foreign_key: true
  end
end

class ChangeTimeToTimeForObservation < ActiveRecord::Migration[7.0]
  def change
    change_column :observations, :time, :time
  end
end

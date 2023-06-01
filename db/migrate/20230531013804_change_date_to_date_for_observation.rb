class ChangeDateToDateForObservation < ActiveRecord::Migration[7.0]
  def change
    change_column :observations, :date, :date
  end
end

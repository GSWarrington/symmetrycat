class AddMonthToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :month, :string
  end
end

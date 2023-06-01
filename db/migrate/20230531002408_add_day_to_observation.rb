class AddDayToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :day, :string
  end
end

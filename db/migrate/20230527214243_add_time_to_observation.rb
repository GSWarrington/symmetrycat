class AddTimeToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :time, :string
  end
end

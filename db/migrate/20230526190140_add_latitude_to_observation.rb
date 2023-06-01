class AddLatitudeToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :latitude, :float
  end
end

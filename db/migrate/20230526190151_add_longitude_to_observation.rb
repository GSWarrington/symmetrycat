class AddLongitudeToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :longitude, :float
  end
end

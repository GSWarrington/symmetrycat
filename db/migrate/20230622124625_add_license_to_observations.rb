class AddLicenseToObservations < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :license, :integer, default: 3
  end
end

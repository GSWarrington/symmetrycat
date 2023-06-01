class AddAddressToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :address, :text
  end
end

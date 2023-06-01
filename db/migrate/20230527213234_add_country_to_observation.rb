class AddCountryToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :country, :string
  end
end

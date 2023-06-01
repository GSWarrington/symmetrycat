class AddCityToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :city, :text
  end
end

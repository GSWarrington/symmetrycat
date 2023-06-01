class AddStreetToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :street, :string
  end
end

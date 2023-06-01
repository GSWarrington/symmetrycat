class AddDescriptionToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :description, :string
  end
end

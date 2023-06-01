class AddRotationsToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :rotations, :string
  end
end

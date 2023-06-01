class AddGlidessToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :glides, :string
  end
end

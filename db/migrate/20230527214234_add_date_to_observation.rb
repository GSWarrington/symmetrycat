class AddDateToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :date, :string
  end
end

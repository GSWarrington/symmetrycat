class AddYearToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :year, :string
  end
end

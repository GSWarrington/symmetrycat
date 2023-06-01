class AddStateToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :state, :text
  end
end

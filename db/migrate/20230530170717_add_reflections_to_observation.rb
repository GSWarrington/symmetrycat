class AddReflectionsToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :reflections, :string
  end
end

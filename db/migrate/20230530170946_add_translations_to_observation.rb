class AddTranslationsToObservation < ActiveRecord::Migration[7.0]
  def change
    add_column :observations, :translations, :string
  end
end

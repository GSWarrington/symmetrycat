class UpdateColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :name, :username
    add_column :users, :displayname, :string
    add_column :users, :bio, :text

    remove_column :observations, :year, :string
    remove_column :observations, :month, :string
    remove_column :observations, :day, :string
    add_column :observations, :transformations, :text
    rename_column :observations, :description, :notes
    remove_column :observations, :title, :string
    add_column :observations, :virtual, :boolean
    add_column :observations, :dimension, :integer
  end
end

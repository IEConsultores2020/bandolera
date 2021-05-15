class ChangeName < ActiveRecord::Migration
  def change
    rename_column :properties, :name, :unencumbered
  end
end

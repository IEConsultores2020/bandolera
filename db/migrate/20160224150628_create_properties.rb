class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end

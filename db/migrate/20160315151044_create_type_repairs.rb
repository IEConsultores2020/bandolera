class CreateTypeRepairs < ActiveRecord::Migration
  def change
    create_table :type_repairs do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end

class CreatePropiedads < ActiveRecord::Migration
  def change
    create_table :propiedads do |t|
      t.string :nombre
      t.string :archivo

      t.timestamps null: false
    end
  end
end

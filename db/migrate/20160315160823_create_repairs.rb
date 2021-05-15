class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.references :type_repair, index: true, foreign_key: true
      t.text :details
      t.string :manpower_name
      t.string :email
      t.string :phone
      t.integer :cost
      t.integer :warranty
      t.date :date_repair
      t.references :user, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

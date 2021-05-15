class CreateAppliances < ActiveRecord::Migration
  def change
    create_table :appliances do |t|
      t.references :property, index: true, foreign_key: true
      t.references :gadget, index: true, foreign_key: true
      t.string :description_string
      t.date :acquisition_date
      t.integer :warranty
      t.integer :contact_number
      t.string :contact_email
      t.boolean :active

      t.timestamps null: false
    end
  end
end

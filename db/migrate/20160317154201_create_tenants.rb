class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.references :property, index: true, foreign_key: true
      t.integer :monthly_rent
      t.integer :monthly_administration
      t.date :begin_date
      t.date :end_date
      t.string :name
      t.integer :phone
      t.string :email
      t.boolean :leasing
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

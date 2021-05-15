class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :tenant, index: true, foreign_key: true
      t.date :paid_period
      t.text :details
      t.references :payment_method, index: true, foreign_key: true
      t.integer :value
      t.boolean :applied

      t.timestamps null: false
    end
  end
end

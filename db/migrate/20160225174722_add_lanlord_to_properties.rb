class AddLanlordToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :landlord, :string
    add_column :properties, :phone, :string
    add_column :properties, :email, :string
    add_column :properties, :address, :string
    add_column :properties, :zipcode, :string
    add_column :properties, :area, :string
    add_column :properties, :hoa, :string
    add_column :properties, :purchase_price, :integer
    add_column :properties, :purchase_date, :date
    add_column :properties, :expenses, :integer
    add_column :properties, :net_proceeds, :integer
    add_column :properties, :earning_capacity, :integer
    add_column :properties, :gross_income, :integer
  end
end

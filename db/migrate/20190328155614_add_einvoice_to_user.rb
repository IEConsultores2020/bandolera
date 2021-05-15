class AddEinvoiceToUser < ActiveRecord::Migration
  def change
    add_column :users, :einvoice, :integer
  end
end

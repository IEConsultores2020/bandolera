class AddInvoiceToAppliances < ActiveRecord::Migration
  def change
    add_column :appliances, :invoice, :string
  end
end

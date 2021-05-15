class AddPurchasePriceToAppliances < ActiveRecord::Migration
  def change
    add_column :appliances, :purchase_price, :integer
  end
end

class AddPurchaseOrderToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :purchase_order, :string
  end
end

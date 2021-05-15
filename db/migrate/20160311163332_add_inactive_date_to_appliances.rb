class AddInactiveDateToAppliances < ActiveRecord::Migration
  def change
    add_column :appliances, :inactive_date, :date,:default => false, :null => false
  end
end

class AddProfitToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :profit, :integer
  end
end

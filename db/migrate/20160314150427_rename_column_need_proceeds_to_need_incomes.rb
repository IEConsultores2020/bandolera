class RenameColumnNeedProceedsToNeedIncomes < ActiveRecord::Migration
  def change
    rename_column :properties, :net_proceeds, :net_income
  end
end

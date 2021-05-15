class RenameManpowerNameToContractor < ActiveRecord::Migration
  def change
    rename_column :repairs, :manpower_name, :contractors 
  end
end

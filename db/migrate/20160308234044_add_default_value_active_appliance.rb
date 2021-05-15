class AddDefaultValueActiveAppliance < ActiveRecord::Migration
  def change  
    def up
      change_column :appliances, :active, :boolean, :default => true
    end

    def down
      change_column :appliances, :active, :boolean, :default => nil
    end
        
  end
end

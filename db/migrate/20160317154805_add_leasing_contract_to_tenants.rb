class AddLeasingContractToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :leasing_contract, :string
  end
end

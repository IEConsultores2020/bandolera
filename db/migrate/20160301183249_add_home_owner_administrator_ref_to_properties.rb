class AddHomeOwnerAdministratorRefToProperties < ActiveRecord::Migration
  def change
    add_reference :properties, :home_owner_administrator, index: true, foreign_key: true
  end
end

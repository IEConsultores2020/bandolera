class AddUserToTienda < ActiveRecord::Migration
  def change
    add_reference :tiendas, :user, index: true
    add_foreign_key :tiendas, :users
  end
end

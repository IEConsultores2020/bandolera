class AddUserToArticulo < ActiveRecord::Migration
  def change
    add_reference :articulos, :user, index: true
    add_foreign_key :articulos, :users
  end
end

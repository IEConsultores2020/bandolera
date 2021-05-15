class AddUserToInventario < ActiveRecord::Migration
  def change
    add_reference :inventarios, :user, index: true
    add_foreign_key :inventarios, :users
  end
end

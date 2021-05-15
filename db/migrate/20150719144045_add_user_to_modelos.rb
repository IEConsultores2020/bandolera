class AddUserToModelos < ActiveRecord::Migration
  def change
    add_reference :modelos, :user, index: true
    add_foreign_key :modelos, :users
  end
end

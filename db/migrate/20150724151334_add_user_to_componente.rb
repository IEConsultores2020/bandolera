class AddUserToComponente < ActiveRecord::Migration
  def change
    add_reference :componentes, :user, index: true
    add_foreign_key :componentes, :users
  end
end

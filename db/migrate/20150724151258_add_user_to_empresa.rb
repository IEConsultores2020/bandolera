class AddUserToEmpresa < ActiveRecord::Migration
  def change
    add_reference :empresas, :user, index: true
    add_foreign_key :empresas, :users
  end
end

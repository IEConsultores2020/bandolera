class AddUserToUnidadMedida < ActiveRecord::Migration
  def change
    add_reference :unidad_medidas, :user, index: true
    add_foreign_key :unidad_medidas, :users
  end
end

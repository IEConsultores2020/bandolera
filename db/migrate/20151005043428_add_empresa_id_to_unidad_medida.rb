class AddEmpresaIdToUnidadMedida < ActiveRecord::Migration
  def change
    add_column :unidad_medidas, :empresa_id, :integer
  end
end

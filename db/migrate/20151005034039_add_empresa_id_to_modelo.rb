class AddEmpresaIdToModelo < ActiveRecord::Migration
  def change
    add_column :modelos, :empresa_id, :integer
  end
end

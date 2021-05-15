class AddEmpresaIdToComponente < ActiveRecord::Migration
  def change
    add_column :componentes, :empresa_id, :integer
  end
end

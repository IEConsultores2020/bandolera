class AddActivoToInscrito < ActiveRecord::Migration
  def change
    add_column :inscritos, :activo, :integer
  end
end

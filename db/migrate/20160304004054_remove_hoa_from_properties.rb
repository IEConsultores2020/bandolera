class RemoveHoaFromProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :hoa, :string
  end
end

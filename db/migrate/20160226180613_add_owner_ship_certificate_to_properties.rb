class AddOwnerShipCertificateToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :owner_ship_certificate, :string
  end
end

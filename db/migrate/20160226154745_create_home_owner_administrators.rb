class CreateHomeOwnerAdministrators < ActiveRecord::Migration
  def change
    create_table :home_owner_administrators do |t|
      t.string :name
      t.string :email
      t.string :mobile

      t.timestamps null: false
    end
  end
end

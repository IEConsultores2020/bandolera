class AddUserRefToProperties < ActiveRecord::Migration
  def change
    add_reference :properties, :user, index: true, foreign_key: true
  end
end

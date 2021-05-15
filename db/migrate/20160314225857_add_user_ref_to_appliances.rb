class AddUserRefToAppliances < ActiveRecord::Migration
  def change
    add_reference :appliances, :user, index: true, foreign_key: true
  end
end

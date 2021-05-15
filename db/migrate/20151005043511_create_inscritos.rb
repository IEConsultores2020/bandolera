class CreateInscritos < ActiveRecord::Migration
  def change
    create_table :inscritos do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :empresa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

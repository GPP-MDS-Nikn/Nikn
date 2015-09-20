class CreateOngs < ActiveRecord::Migration
  def change
    create_table :ongs do |t|
      t.string :name
      t.text :description
      t.string :adress

      t.timestamps null: false
    end
  end
end

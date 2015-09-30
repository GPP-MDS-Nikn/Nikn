class CreateOngs < ActiveRecord::Migration
  def change
    create_table :ongs do |t|
    #Creates ongs with the respective fields on database
      t.string :name
      t.text :description
      t.text :adress
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end

class CreateCareUnits < ActiveRecord::Migration
  def change
    create_table :care_units do |t|
      t.string "district"
      t.string "category"
      t.string "institution"
      t.text "description"
      #t.text "observation"
      t.string "name"
      t.string "address"
      t.string "zip_code"
      t.string "city"
      t.string "phone"
      t.string "email"
      t.string "site"
      t.string "latitude"
      t.string "longitude"

      t.timestamps null: false
    end
  end
end

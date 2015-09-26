class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string "municipio"
      t.string "estado"
      t.string "cod_mun7"
      t.string "cod_mun6"
      t.string "uf"
      t.text "localizacao"
      t.timestamps null: false
    end
  end
end

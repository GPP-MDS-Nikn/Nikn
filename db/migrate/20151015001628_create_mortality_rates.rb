class CreateMortalityRates < ActiveRecord::Migration
  def change
    create_table :mortality_rates do |t|
      t.string :regiao
      t.string :nome
      t.string :taxa

      t.timestamps null: false
    end
  end
end

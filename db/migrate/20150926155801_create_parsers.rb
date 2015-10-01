class CreateParsers < ActiveRecord::Migration
  def change
    create_table :parsers do |t|

      t.timestamps null: false
    end
  end
end

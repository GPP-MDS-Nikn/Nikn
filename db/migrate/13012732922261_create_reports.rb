class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
        t.string :content
        t.integer :post_id
        t.timestamps null: false
    end
  end
end

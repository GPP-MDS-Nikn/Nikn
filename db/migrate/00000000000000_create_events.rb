class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.string :name
			t.string :local
			t.text :description
			t.datetime :date
			
			# this field has the path to the image displayed at its event page.
			t.string :photo_path
			
			t.timestamps null: false
		end
	end
end

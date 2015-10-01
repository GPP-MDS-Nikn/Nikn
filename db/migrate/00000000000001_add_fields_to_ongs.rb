class AddFieldsToOngs < ActiveRecord::Migration
	def change
	    add_column :ongs, :name, :string
	    add_column :ongs, :description, :text
	    add_column :ongs, :adress, :text
 	 end
end
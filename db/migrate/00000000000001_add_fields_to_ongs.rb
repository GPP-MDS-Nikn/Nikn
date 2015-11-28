class AddFieldsToOngs < ActiveRecord::Migration
	def change
		# Basic information
		add_column :ongs, :name, :string
		add_column :ongs, :description, :text

		# Contact details
		add_column :ongs, :site, :string
		add_column :ongs, :phone, :string
		add_column :ongs, :auxiliary_phone, :string

		# Localization details
		add_column :ongs, :cep, :string
		add_column :ongs, :address, :text
		add_column :ongs, :complement, :string
		add_column :ongs, :uf, :string
		add_column :ongs, :city, :string
	end
end

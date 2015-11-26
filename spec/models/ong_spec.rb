require 'rails_helper'

describe Ong do
	context "when using valid data" do
		it "should create a valid instance of object ONG" do
			ong = create_ong("1")
			expect(ong.valid?).to be true
		end
	end

	private
		# Ong constants (in characters)
		NAME_MIN_LENGTH 				= 8
		DESCRIPTION_MIN_LENGTH 	= 100
		SITE_MIN_LENGTH 				= 5
		PHONES_MIN_LENGTH 			= 10
		PHONES_MAX_LENGTH 			= 11
		CEP_LENGTH 							= 8
		ADDRESS_MIN_LENGTH 			= 10
		UF_LENGTH 							= 2
		CITY_MIN_LENGTH 				= 3

		# Default settings to test, only valid fields.
		def create_ong(id="1", options={})
			Ong.create({
			email: "ong" + id + "@example.com",
			password: "password",
			password_confirmation: "password",
			name: "Ong" + id + " name example",
			description: ("Description " + id + " example")*10,
			site: "www.example" + id + ".com",
			phone: "613333222" + id,
			auxiliary_phone: "613333222" + id,
			cep: id + "2345678",
			address: "example address " + id,
			uf: "DF",
			city: "Brasilia"
			}.merge(options))
		end

end

require 'rails_helper'

describe Ong do
	context "when using valid data" do
		it "should create a valid instance of object ONG" do
			ong = create_ong("1")
			expect(ong.valid?).to be true
		end
	end

	# Attributes 'email' and 'password' are already being tested by devise and do not need to be tested here.
	# Then, code below checks integrity of rest of the attributes in order to create ONG instances correctly.

	# Must create ongs without site or auxiliary phone, and, in that case, system should not test uniqueness of attribute.
	context "when hiding not needed data" do
		it "should create an object without site" do
			ong = create_ong
			ong.site = nil
			expect(ong.valid?).to be true
		end

		it "should create many objects without site" do
			ong1 = create_ong
			ong1.site = nil
			ong2 = create_ong("2")
			ong2.site = nil
			expect(ong1.valid? && ong2.valid?).to be true
		end

		it "should create an object without an auxiliary phone" do
			ong = create_ong
			ong.auxiliary_phone = nil
			expect(ong.valid?).to be true
		end

		it "should create many objects without an auxiliary phone" do
			ong1 = create_ong
			ong1.auxiliary_phone = nil
			ong2 = create_ong("2")
			ong2.auxiliary_phone = nil
			expect(ong1.valid? && ong2.valid?).to be true
		end
	end

	# Must not create ongs with empty (if the presence is needed) or too small string attributes
	context "when using empty or too small/large data" do
		it "shouldn't create an object with an empty name" do
			ong = create_ong
			ong.name = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a name too small" do
			ong = create_ong
			ong.name = "a"*(NAME_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an empty description" do
			ong = create_ong
			ong.description = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a description too small" do
			ong = create_ong
			ong.description = "a"*(DESCRIPTION_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a site too small" do
			ong = create_ong
			ong.site = "a"*(SITE_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an empty phone" do
			ong = create_ong
			ong.phone = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a phone too small" do
			ong = create_ong
			ong.phone = "1"*(PHONES_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a phone too large" do
			ong = create_ong
			ong.phone = "1"*(PHONES_MAX_LENGTH + 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an auxiliary phone too small" do
			ong = create_ong
			ong.auxiliary_phone = "1"*(PHONES_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an auxiliary phone too large" do
			ong = create_ong
			ong.auxiliary_phone = "1"*(PHONES_MAX_LENGTH + 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an empty cep" do
			ong = create_ong
			ong.cep = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a cep too small" do
			ong = create_ong
			ong.cep = "1"*(CEP_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a cep too large" do
			ong = create_ong
			ong.cep = "1"*(CEP_LENGTH + 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an empty address" do
			ong = create_ong
			ong.address = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an address too small" do
			ong = create_ong
			ong.address = "a"*(ADDRESS_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an empty uf" do
			ong = create_ong
			ong.uf = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an uf too small" do
			ong = create_ong
			ong.uf = "a"*(UF_LENGTH - 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an uf too large" do
			ong = create_ong
			ong.uf = "a"*(UF_LENGTH + 1)
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with an empty city" do
			ong = create_ong
			ong.city = nil
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with a city too small" do
			ong = create_ong
			ong.city = "a"*(CITY_MIN_LENGTH - 1)
			expect(ong.valid?).to be false
		end
	end

	# Must not create ongs with other kinds of invalid attributes, such as letters in phones or ceps or invalid UFs.
	context "when using invalid data" do
		it "shouldn't create an object with letters in phone" do
			ong = create_ong
			ong.phone = "a"*PHONES_MIN_LENGTH
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with letters in auxiliary phone" do
			ong = create_ong
			ong.auxiliary_phone = "a"*PHONES_MIN_LENGTH
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with letters in cep" do
			ong = create_ong
			ong.cep = "a"*CEP_LENGTH
			expect(ong.valid?).to be false
		end

		it "shouldn't create an object with invalid UFs" do
			ong = create_ong
			ong.uf = "ZZ"
			expect(ong.valid?).to be false
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

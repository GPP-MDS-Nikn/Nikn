# Many parts of this model are already being tested by devise gem and do not need to be tested here.
# devise is already testing: email validation and presence, password validation, presence and confirmation, sign in, sign out and edit current user.

require 'rails_helper'

describe Ong, type: :model do
	# Loading the seed.rb file in order to initialize default roles
	Rails.application.load_seed

	# Valid tests
	context "when providing valid data" do

		it "should be an instance of Ong" do
			ong = create_ong # Only valid data
			expect(ong).to be_instance_of(Ong)
		end

		it 'should have default role' do
			ong = create_ong
			expect(ong.roles.count).to be_equal(1)
		end

	end

	private
		# Create Ong with default parameters, valid fields only
		def create_ong(options={})
			Ong.create({
			email: "example@email.com",
			password: "password",
			password_confirmation: "password"
			}.merge(options))
		end

end

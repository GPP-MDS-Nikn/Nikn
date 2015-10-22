require 'rails_helper'

RSpec.describe Ong, type: :model do
  
  context "Creating a valid object and comparing parameters" do
  	it "Should create a valid instance of object ONG" do
  		ong = create_ong
  		expect(ong.valid?).to be_instance_of(Ong)
  	end


  end


  context "Trying to create objetcs and validate with invalid data" do

  it "shouldn't create a valid object with empty name" do

  	ong = create_ong(:name nil)
  	expect(ong.valid?).to be false

  end

  end

end
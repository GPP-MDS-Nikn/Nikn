require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Ong do
    context "Creating a valid object and comparing parameters" do

        it "Should create a valid instance of object ONG" do
  		    ong = create_ong
  		    expect(ong.valid?).to be true
  	    end
    end

    context "Trying to create objetcs and validate with invalid data" do

        it "shouldn't create a valid object with empty email" do
    	    ong = create_ong(email: nil)
    	    expect(ong.valid?).to be false

        end

    end

    private

    def create_ong(options={})
      Ong.create({
        email: "ong_test@email.com",
        password: "12345678"
      }.merge(options))
    end

end

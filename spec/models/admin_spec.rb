require 'rails_helper'

describe Admin do
    context "when providing valid data" do
        it "should be an instance of Admin" do
			admin = create_admin # Only valid data
			expect(admin).to be_instance_of(Admin)
		end
    end
    context "when providing invalid data" do
        it "shouldn't create an instance of Admin" do
            admin = create_admin(email: nil)
			expect(admin.valid?).to be false
        end
    end


    private
        # Default settings to test.
        # Only valid fields.
        def create_admin(options={})
            Admin.create({
                email: "admin@admin.com",
                password: "12345678"
            }.merge(options))
        end
end

require 'rails_helper'

RSpec.describe CareUnit, type: :model do
  context "when providing valid data" do
    before(:each) do
      @care_unit = create_care_unit
    end
    # Test if the creator are working well
    it "should be an instance of CareUnit" do
      expect(@care_unit).to be_instance_of(CareUnit)
    end

    # Test if the creator returns a valid object
    it "should be valid to save" do
      expect(@care_unit).to be_valid
    end

    # Test if the creator increase the database
    it "should increase the database" do
      expect {
        another_care_unit = @care_unit.dup
        another_care_unit.save
      }.to change(CareUnit, :count).by(1)
    end

    # Test if is possible to add a UDA without an email
    it "should be valid without an email address" do
      @care_unit.email = ""
      expect(@care_unit).to be_valid
    end
  end

  context "when providing invalid data" do
    context "for each wrong param" do
      # Test with wrong district
      it "should not be valid without a district" do
        care_unit = create_care_unit({district: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with number as district" do
        care_unit = create_care_unit({district: "10"})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too much letters" do
        care_unit = create_care_unit({district: "A"*3})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with less than 2 letters" do
        care_unit = create_care_unit({district: "A"})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with lowercase format" do
        care_unit = create_care_unit({district: "aa"})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong category
      it "should not be valid without a category name" do
        care_unit = create_care_unit({category: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long category name" do
        invalid_category_name = "a" * (CareUnit::CATEGORY_MAX_LENGTH + 1)
        care_unit = create_care_unit({category: invalid_category_name})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too short category name" do
        invalid_category_name = "a" * (CareUnit::CATEGORY_MIN_LENGTH - 1)
        care_unit = create_care_unit({category: invalid_category_name})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong institution
      it "should not be valid without a institution name" do
        care_unit = create_care_unit({institution: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long institution name" do
        invalid_institution_name = "a" * (CareUnit::INSTITUTION_MAX_LENGTH + 1)
        care_unit = create_care_unit({institution: invalid_institution_name})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too short institution name" do
        invalid_institution_name = "a" * (CareUnit::INSTITUTION_MIN_LENGTH - 1)
        care_unit = create_care_unit({institution: invalid_institution_name})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong description
      it "should not be valid without a description" do
        care_unit = create_care_unit({description: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long description" do
        invalid_description = "a" * (CareUnit::DESCRIPTION_MAX_LENGTH + 1)
        care_unit = create_care_unit({description: invalid_description})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too short description" do
        invalid_description = "a" * (CareUnit::DESCRIPTION_MIN_LENGTH - 1)
        care_unit = create_care_unit({description: invalid_description})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong name
      it "should not be valid without a name" do
        care_unit = create_care_unit({name: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long name" do
        invalid_name = "a" * (CareUnit::NAME_MAX_LENGTH + 1)
        care_unit = create_care_unit({name: invalid_name})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too short name" do
        invalid_name = "a" * (CareUnit::NAME_MIN_LENGTH - 1)
        care_unit = create_care_unit({name: invalid_name})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong address
      it "should not be valid without a address" do
        care_unit = create_care_unit({address: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long address" do
        invalid_address = "a" * (CareUnit::ADDRESS_MAX_LENGTH + 1)
        care_unit = create_care_unit({address: invalid_address})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too short address" do
        invalid_address = "a" * (CareUnit::ADDRESS_MIN_LENGTH - 1)
        care_unit = create_care_unit({address: invalid_address})
        expect(care_unit).not_to be_valid
      end

      #Test with wrong zip code
      it "should not be valid without a zip code" do
        care_unit = create_care_unit({zip_code: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid without (\'-\')" do
        invalid_zip_code = "12345678"
        care_unit = create_care_unit({zip_code: invalid_zip_code})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with idiot characters" do
        invalid_zip_code = "abc@3d12"
        care_unit = create_care_unit({zip_code: invalid_zip_code})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid when it has a wrong number of characters" do
        invalid_zip_code = "12345-5678"
        care_unit = create_care_unit({zip_code: invalid_zip_code})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid when it has a invalid format (XXXXX-XXX)" do
        invalid_zip_code = "123-5678"
        care_unit = create_care_unit({zip_code: invalid_zip_code})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong city
      it "should not be valid without a city" do
        care_unit = create_care_unit({city: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long city" do
        invalid_city = "a" * (CareUnit::CITY_MAX_LENGTH + 1)
        care_unit = create_care_unit({city: invalid_city})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too short city" do
        invalid_city = "a" * (CareUnit::CITY_MIN_LENGTH - 1)
        care_unit = create_care_unit({city: invalid_city})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong phone
      it "should not be valid without a phone-number" do
        care_unit = create_care_unit({phone: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid without DDD" do
        invalid_phone_number = "9988-7744"
        care_unit = create_care_unit({phone: invalid_phone_number})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid without (\'-\')" do
        invalid_phone_number = "(00)99887744"
        care_unit = create_care_unit({phone: invalid_phone_number})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid without parenthesis" do
        invalid_phone_number = "00 9988-7744"
        care_unit = create_care_unit({phone: invalid_phone_number})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with any letter" do
        invalid_phone_number = "(00)9a88-77aa"
        care_unit = create_care_unit({phone: invalid_phone_number})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid with too long DDD" do
        invalid_phone_number = "(000)9988-7766"
        care_unit = create_care_unit({phone: invalid_phone_number})
        expect(care_unit).not_to be_valid
      end

      # Test with wrong email
      it "should not be valid without (\'@\')" do
        invalid_email = "test.test.te"
        care_unit = create_care_unit({email: invalid_email})
        expect(care_unit).not_to be_valid
      end

      it "should not be valid without valid domain" do
        invalid_email = "test@test"
        care_unit = create_care_unit({email: invalid_email})
        expect(care_unit).not_to be_valid
      end

      it "should not increase de database when invalid" do
        invalid_email = "test@test"
        expect{
          care_unit = create_care_unit({email: invalid_email})
          care_unit.save
        }.to change(CareUnit, :count).by(0)
      end

      # Test with wrong latitude
      it "should not be valid without a latitude" do
        care_unit = create_care_unit({latitude: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not increase the database when the latitude is missing" do
        expect{
          care_unit = create_care_unit({latitude: nil})
          care_unit.save
        }.to change(CareUnit, :count).by(0)
      end

      # Test with wrong longitude
      it "should not be valid without a longitude" do
        care_unit = create_care_unit({longitude: nil})
        expect(care_unit).not_to be_valid
      end

      it "should not increase the database when the longitude is missing" do
        expect{
          care_unit = create_care_unit({longitude: nil})
          care_unit.save
        }.to change(CareUnit, :count).by(0)
      end
    end
  end

  private
    # Default settings to testing.
    # Only valid data.
    def create_care_unit(options = {})
     CareUnit.create({
      district:       "TT",
      category:       "a"*CareUnit::CATEGORY_MIN_LENGTH,
      institution:    "a"*CareUnit::INSTITUTION_MIN_LENGTH,
      description:    "a"*CareUnit::DESCRIPTION_MIN_LENGTH,
      name:           "a"*CareUnit::NAME_MIN_LENGTH,
      address:        "a"*CareUnit::ADDRESS_MIN_LENGTH,
      zip_code:       "12345-123", 
      city:           "a"*CareUnit::CITY_MIN_LENGTH,
      phone:          "(12) 3456-7890",
      email:          "test@test.tt",
      site:           "www.test.rsp.ec",
      latitude:       "12.123456789",
      longitude:      "12.123456789"
     }.merge(options))
    end
end

require 'rails_helper'

RSpec.describe CareUnit, type: :model do
  context "when providing valid data" do

  end

  context "when providing invalid data" do

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

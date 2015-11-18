require 'rails_helper'

describe Api::V1::CareUnitsController do
  before(:each) { request.headers['Accept'] = "application/vnd.example.v1" }

  describe "GET #show" do
    before(:each) do
      @care_unit = FactoryGirl.create :care_unit
      get :show, id: @care_unit.id, format: :json
    end

    it "return the district of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:district]).to eql @care_unit.district
    end

    it "return the category of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:category]).to eql @care_unit.category
    end

    it "return the description of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:description]).to eql @care_unit.description
    end

    it "return the institution of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:institution]).to eql @care_unit.institution
    end

    it "return the address of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:address]).to eql @care_unit.address
    end

    it "return the zip_code of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:zip_code]).to eql @care_unit.zip_code
    end

    it "return the city of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:city]).to eql @care_unit.city
    end

    it "return the phone of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:phone]).to eql @care_unit.phone
    end

    it "return the email of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:email]).to eql @care_unit.email
    end

    it "return the site of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:site]).to eql @care_unit.site
    end

    it "return the latitude of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:latitude]).to eql @care_unit.latitude
    end

    it "return the longitude of care_unit" do
      care_unit_response = JSON.parse(response.body, symbolize_names: true)
      expect(care_unit_response[:longitude]).to eql @care_unit.longitude
    end

    it "returns a success status code" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index" do
    before(:each) do
      FactoryGirl.create :care_unit, city: "Brasilia"
      FactoryGirl.create :care_unit, city: "São Paulo"
      get :index, format: :json
    end

    it "returns all the care_units" do

      body = JSON.parse(response.body)
      care_unit_cities = body.map { |m| m["city"] }

      expect(care_unit_cities).to match_array(["Brasilia",

                                           "São Paulo"])
    end

    it "returns a success status code" do
      expect(response).to have_http_status(200)
    end

  end

end

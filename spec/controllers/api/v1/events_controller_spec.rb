require 'rails_helper'

describe Api::V1::EventsController do
  before(:each) { request.headers['Accept'] = "application/vnd.example.v1" }

  describe "GET #show" do
    before(:each) do
      @event = FactoryGirl.create :event
      get :show, id: @event.id, format: :json
    end

    it "return the title of event" do
      event_response = JSON.parse(response.body, symbolize_names: true)
      expect(event_response[:title]).to eql @event.title
    end

    it "return the local of event" do
      event_response = JSON.parse(response.body, symbolize_names: true)
      expect(event_response[:local]).to eql @event.local
    end

    it "return the description of event" do
      event_response = JSON.parse(response.body, symbolize_names: true)
      expect(event_response[:description]).to eql @event.description
    end

    it "return the start_time of event" do
      event_response = JSON.parse(response.body, symbolize_names: true)
      expect(event_response[:start_time]).to eql @event.start_time
    end

    it "return the end_time of event" do
      event_response = JSON.parse(response.body, symbolize_names: true)
      expect(event_response[:end_time]).to eql @event.end_time
    end

    it "returns a success status code" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index" do
    before(:each) do
      FactoryGirl.create :event, title: "Title test 1"
      FactoryGirl.create :event, title: "Title test 2"
      get :index, format: :json
    end

    it "returns all the events" do

      body = JSON.parse(response.body)
      event_titles = body.map { |m| m["title"] }

      expect(event_titles).to match_array(["Title test 1",
                                           "Title test 2"])
    end

    it "returns a success status code" do
      expect(response).to have_http_status(200)
    end

  end

end

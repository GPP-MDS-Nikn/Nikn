require 'rails_helper'

describe Api::V1::PortalPostsController do
  before(:each) { request.headers['Accept'] = "application/vnd.example.v1" }

  describe "GET #show" do
    before(:each) do
      @portal_post = FactoryGirl.create :portal_post
      get :show, id: @portal_post.id, format: :json
    end

    it "return the title of post" do
      portal_post_response = JSON.parse(response.body, symbolize_names: true)
      expect(portal_post_response[:title]).to eql @portal_post.title
    end

    it "return the author of post" do
      portal_post_response = JSON.parse(response.body, symbolize_names: true)
      expect(portal_post_response[:author]).to eql @portal_post.author
    end

    it "return the body of post" do
      portal_post_response = JSON.parse(response.body, symbolize_names: true)
      expect(portal_post_response[:body]).to eql @portal_post.body
    end

    it "returns a success status code" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #index" do
    before(:each) do
      FactoryGirl.create :portal_post, title: "Title test 1"
      FactoryGirl.create :portal_post, title: "Title test 2"
      get :index, format: :json
    end

    it "returns all the portal posts" do

      body = JSON.parse(response.body)
      portal_post_titles = body.map { |m| m["title"] }

      expect(portal_post_titles).to match_array(["Title test 1",
                                           "Title test 2"])
    end

    it "returns a success status code" do
      expect(response).to have_http_status(200)
    end

  end

end

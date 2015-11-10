require 'rails_helper'

describe ForumPostsController, :type => :controller do
    context "creating a new post" do
        it "saves a new post" do
            expect{create_post}.to change(ForumPost, :count).by(1)
        end

        it "initialize with 0 reports" do
            @post = create_post
            expect(@post.reports).to eq(0)
        end

        it "denies creation of bad post" do
            expect{create_post(content: "a")}.to change(ForumPost, :count).by(0)
        end

    end


private
    # Default settings to test.
    # Only valid fields.
    def create_post(options={})
        ForumPost.create({
            content: "content"
        }.merge(options))
    end

    def post_params(options={})
        return ({
            content: "content"
        }.merge(options))
    end

end

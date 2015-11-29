require 'rails_helper'

describe ForumPostsController, :type => :controller do
    context "creating a new post" do
        it "saves a new post" do
            @topic = create(:forum_topic)
            @post_attrs = attributes_for(:forum_post, :forum_topic_id => @topic.id)
            expect{
                post :create, :forum_topic_id => @topic, :forum_post => @post_attrs
            }.to change(ForumPost, :count).by(1)
        end

        it "initialize with 0 reports" do

        end

        it "denies creation of bad post" do
        
        end

    end
end

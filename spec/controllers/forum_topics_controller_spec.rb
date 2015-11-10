require 'rails_helper'

describe ForumTopicsController, :type => :controller do
    context "creating a new topic" do
        it "saves a new topic" do
            expect{create_topic}.to change(ForumTopic, :count).by(1)
        end

        it "initializes with 0 reports" do
            @topic = create_topic
            expect(@topic.reports).to eq(0)
        end

        it "denies creation of bad title" do
            expect{create_topic(title: "a")}.to change(ForumTopic, :count).by(0)
        end

        it "denies creation of bad body" do
            expect{create_topic(body: "a")}.to change(ForumTopic, :count).by(0)
        end

    end


private
    # Default settings to test.
    # Only valid fields.
    def create_topic(options={})
        ForumTopic.create({
            title: "title",
            body: "body"
        }.merge(options))
    end

end

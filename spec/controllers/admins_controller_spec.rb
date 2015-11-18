require 'rails_helper'

describe AdminsController, :type => :controller do
    context "dealing with posts reports" do
        it "don't select posts with less than 5 reports" do
            @post = create_post(reports: 4)
            @post.save
            @forum_posts = ForumPost.all
            @reported_posts = @forum_posts.select { |post| post.reports >= 5 }
            expect(@reported_posts.size).to eq(0)
        end

        it "select posts with more or exactely 5 reports" do
            @post = create_post(reports: 5)
            @post.save
            @forum_posts = ForumPost.all
            @reported_posts = @forum_posts.select { |post| post.reports >= 5 }
            expect(@reported_posts.size).to eq(1)
        end
    end

    context "dealing with topics reports" do
        it "don't select posts with less than 5 reports" do
            @topic = create_topic(reports: 4)
            @topic.save
            @forum_topics = ForumTopic.all
            @reported_topics = @forum_topics.select { |topic| topic.reports >= 5 }
            expect(@reported_topics.size).to eq(0)
        end

        it "select posts with more or exactely 5 reports" do
            @topic = create_topic(reports: 5)
            @topic.save
            @forum_topics = ForumTopic.all
            @reported_topics = @forum_topics.select { |topic| topic.reports >= 5 }
            expect(@reported_topics.size).to eq(1)
        end
    end

private
    def create_post(options={})
        ForumPost.create({
            content: "content"
        }.merge(options))
    end

    def create_topic(options={})
        ForumTopic.create({
            title: "title",
            body: "body"
        }.merge(options))
    end


end

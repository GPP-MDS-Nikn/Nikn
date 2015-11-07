require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ForumTopic do
    context "Creating a valid object and comparing parameters" do

        it "Should create a valid instance of object forum_topic" do
  		    forum_topic = create_forum_topic
  		    expect(forum_topic.valid?).to be true
  	    end
    end

    context "Trying to create objetcs and validate with invalid data" do

        #Title tests
        it "shouldn't create a valid object with empty title" do
    	    forum_topic = create_forum_topic(:title => nil)
    	    expect(forum_topic.valid?).to be false
        end

        it "shouldn't create a valid object with short title" do
          forum_topic = create_forum_topic(title: "a" * (ForumTopic::TITLE_MIN_LENGTH - 1))
          expect(forum_topic.valid?).to be false
        end

        it "shouldn't create an object that already exist" do
          forum_topic = create_forum_topic(title: "Forum topic title sample")
          forum_topic2 = create_forum_topic(title: "Forum topic title sample")
          expect(forum_topic2.valid?).to be false
        end

        #Body tests
        it "shouldn't create a valid object with empty title" do
    	    forum_topic = create_forum_topic(:body => nil)
    	    expect(forum_topic.valid?).to be false
        end

        it "shouldn't create a valid object with short title" do
          forum_topic = create_forum_topic(body: "a" * (ForumTopic::BODY_MIN_LENGTH - 1))
          expect(forum_topic.valid?).to be false
        end

    end

    private

    def create_forum_topic(options={})
      ForumTopic.create({
        title: "Forum topic title sample",
        body: "Forum topic body sample"
      }.merge(options))
    end

end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ForumTopics do
    context "Creating a valid object and comparing parameters" do
  	    
        it "Should create a valid instance of object forum_topic" do
  		    forum_topic = create_forum_topic
  		    expect(forum_topic.valid?).to be_instance_of(forum_topic)
  	    end
    end

    context "Trying to create objetcs and validate with invalid data" do

        #Title tests
        it "shouldn't create a valid object with empty title" do
    	    forum_topic = create_forum_topic(:title nil)
    	    expect(forum_topic.valid?).to be false
        end

        it "shouldn't create a valid object with short title" do
          forum_topic = create_forum_topic(title: "a" * (Forumtopic::TITLE_MIN_LENGTH - 1))
          expect(forum_topic.valid?).to be false
        end

        it "shouldn't create a valid object with too long titles" do
          forum_topic = create_forum_topic(title: "a" * (Forumtopic::TITLE_MAX_LENGTH + 1))
          expect(forum_topic.valid?).to be false
        end

    end

    private
    
    def create_forum_topic(options={})
      ForumTopics.create({
        title: "Forum topic title sample",
        author: "Forum topic content sample"
        body: "Forum topic body sample"
      }.merge(options))
    end

end
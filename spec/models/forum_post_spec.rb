require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ForumPosts do
    context "Creating a valid object and comparing parameters" do
  	    
        it "Should create a valid instance of object forum_post" do
  		    forum_post = create_forum_post
  		    expect(forum_post.valid?).to be_instance_of(forum_post)
  	    end
    end

    context "Trying to create objetcs and validate with invalid data" do

        it "shouldn't create a valid object with empty name" do
    	    forum_post = create_forum_post(:title nil)
    	    expect(forum_post.valid?).to be false

        end

    end

    private
    
    def create_forum_post(options={})
      ForumPosts.create({
        title: "Forum post title sample",
        content: "Forum post content sample"
      }.merge(options))
    end

end
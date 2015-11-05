require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ForumPosts do
    context "Creating a valid object and comparing parameters" do

        it "Should create a valid instance of object forum_post" do
  		    forum_post = create_forum_post
  		    expect(forum_post.valid?).to be_instance_of(forum_post)
  	    end
    end

    context "Trying to create objetcs and validate with invalid data" do

        #Title tests
        it "shouldn't create a valid object with empty title" do
    	    forum_post = create_forum_post(:title nil)
    	    expect(forum_post.valid?).to be false
        end

        it "shouldn't create a valid object with short title" do
          forum_post = create_forum_post(title: "a" * (ForumPost::TITLE_MIN_LENGTH - 1))
          expect(forum_post.valid?).to be false
        end

        it "shouldn't create a valid object with too long titles" do
          forum_post = create_forum_post(title: "a" * (ForumPost::TITLE_MAX_LENGTH + 1))
          expect(forum_post.valid?).to be false
        end

        # Content tests
        it "shouldn't create a valid object without content" do
          forum_post = create_forum_post(content: nil)
          expect(forum_post.valid?).to be false
        end

        it "shouldn't create a valid object with short CONTENT" do
          forum_post = create_forum_post(content: "a" * (ForumPost::CONTENT_MIN_LENGTH - 1))
          expect(forum_post.valid?).to be false
        end

        it "shouldn't create a valid object with too long CONTENT" do
          forum_post = create_forum_post(content: "a" * (ForumPost::CONTENT_MAX_LENGTH + 1))
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

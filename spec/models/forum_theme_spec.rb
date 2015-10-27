require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ForumThemes do
    context "Creating a valid object and comparing parameters" do

        it "Should create a valid instance of object forum_theme" do
  		    forum_theme = create_forum_theme
  		    expect(forum_theme.valid?).to be_instance_of(forum_theme)
  	    end
    end

    context "Trying to create objetcs and validate with invalid data" do

        #Title tests
        it "shouldn't create a valid object with empty title" do
    	    forum_theme = create_forum_theme(:title nil)
    	    expect(forum_theme.valid?).to be false
        end

        it "shouldn't create a valid object with short title" do
          forum_theme = create_forum_theme(title: "a" * (ForumPost::TITLE_MIN_LENGTH - 1))
          expect(forum_theme.valid?).to be false
        end

        it "shouldn't create an object that already exist" do
          forum_post = create_forum_post(title: "Forum theme title sample")
          expect(forum_topic.valid?).to be false
        end

        #Description tests
        it "shouldn't create a valid object without description" do
          forum_theme = create_forum_theme(description: nil)
          expect(forum_theme.valid?).to be false
        end

        it "shouldn't create a valid object with short description" do
          forum_theme = create_forum_theme(description: "a" * (ForumPost::DESCRIPTION_MIN_LENGTH - 1))
          expect(forum_theme.valid?).to be false
        end

    end

    private

    def create_forum_theme(options={})
      ForumThemes.create({
        title: "Forum theme title sample",
        description: "Forum theme description sample"
      }.merge(options))
    end

end

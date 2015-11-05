require 'rails_helper'

describe ForumThemesController do
		describe "POST #create" do

		 	it "creates a new theme in database" do
		      forum_topic_params = {:title => "theme", :description => "lalalala", :author => "autor"}
		      post :create, {:forum_theme => forum_theme_params}
		      expect{ForumTheme.count}.to eq(1)
		 	end

	 end
end

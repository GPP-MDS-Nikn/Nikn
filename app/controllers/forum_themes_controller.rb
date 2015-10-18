class ForumThemesController < ApplicationController
	def index
		@forum_theme = ForumTheme.all
	end
	
	def show 
	  	@forum_theme = ForumTheme.find(params[:id]) 
	  	@forum_topic = @forum_theme.destinations 
	end

end
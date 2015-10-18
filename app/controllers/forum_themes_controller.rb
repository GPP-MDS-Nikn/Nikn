class ForumThemesController < ApplicationController
	def index
		@forum_theme = ForumTheme.all
	end
	
	def show 
	  	@forum_theme = ForumTheme.find(params[:id]) 
	end

	def new
		@forum_theme = ForumTheme.new
	end

	def create
		@forum_theme = ForumTheme.new(forum_theme_params)

		if @forum_theme.save
			redirect_to @forum_theme
		else
			render 'new'
		end
	end

	private

  	def forum_theme_params
    	params.require(:forum_theme).permit(:title, :description)
  	end

end
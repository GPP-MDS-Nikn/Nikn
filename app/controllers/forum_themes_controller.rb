class ForumThemesController < ApplicationController
	def index
		@forum_theme = ForumTheme.all
		@forum_topic = ForumTopic.all
	end
	
	def show 
	  	set_forum_theme
	  	@forum_topics = @forum_theme.forum_topics
	end

	def new
		@forum_theme = ForumTheme.new
	end

	def create
		@forum_theme = ForumTheme.new(forum_theme_params)

		if @forum_theme.save
			redirect_to '/forum_themes'
		else
			render 'new'
		end
	end

	def edit
		set_forum_theme
	end

	def update
		set_forum_theme
	    if @forum_theme.update(forum_theme_params)
	      flash[:success] = "Tema atualizado!"

	      redirect_to @forum_theme
	    else
	      render :edit
	    end
  	end

	def destroy 
		set_forum_theme
		@forum_theme.destroy
		redirect_to forum_themes_path
	end

	private

	 def set_forum_theme
      @forum_theme = ForumTheme.find(params[:id])
    end

  	def forum_theme_params
    	params.require(:forum_theme).permit(:title, :description)
  	end

end
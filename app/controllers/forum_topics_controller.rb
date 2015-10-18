class ForumTopicsController < ApplicationController

	def index
		@forum_topic = ForumTopic.all
	end

	def show
	    @forum_topic = ForumTopic.find(params[:id])
  	end

  	def new
  		@forum_theme = ForumTheme.find(params[:forum_theme_id])
  		@forum_topic = @forum_theme.forum_topics.create
  		#order.baskets.create()
  	end


	def create
		@forum_theme = ForumTheme.find(params[:forum_theme_id])
		@forum_topic = @forum_theme.forum_topics.create(params[:forum_topic].permit(:title, :body))
		@forum_topic.save
		if @forum_topic.save
			redirect_to forum_theme_path(@forum_theme)
		else
			redirect_to "/forum_themes"
		end
	end

	private

	  	def forum_topic_params
	    	params.require(:forum_topic).permit(:title, :body, :author)
	  	end

end
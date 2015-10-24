class ForumTopicsController < ApplicationController

	def index
		@forum_topic = ForumTopic.all
	end

	def show
		@forum_theme = ForumTheme.find(params[:forum_theme_id])
	    @forum_topic = @forum_theme.forum_topics.find(params[:id])
	    @forum_post = @forum_topic.forum_posts.build
  	end

  	def new
  		@forum_theme = ForumTheme.find(params[:forum_theme_id])
  		@forum_topic = @forum_theme.forum_topics.build
  	end


	def create
		@forum_theme = ForumTheme.find(params[:forum_theme_id])
		@forum_topic = @forum_theme.forum_topics.build(forum_topic_params)
		@forum_topic.save
		if @forum_topic.save
			redirect_to forum_theme_path(@forum_theme)
		else
			render 'new'
		end
	end

	def edit
		set_forum_topic
	end

	def update
		set_forum_topic
	    if @forum_topic.update(forum_topic_params)
	      flash[:success] = "Tópico atualizado!"

	      redirect_to @forum_topic
	    else
	      render :edit
	    end
  	end

	def destroy 
		set_forum_topic
		@forum_topic.destroy
		redirect_to forum_topic_path
	end

	private

	def set_forum_topic
		@forum_topic = ForumTopic.find(params[:id]).includes(:forum_themes)
	end

  	def forum_topic_params
	    	params.require(:forum_topic).permit(:title, :body, :author)
	end

end
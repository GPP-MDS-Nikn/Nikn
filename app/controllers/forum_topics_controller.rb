class ForumTopicsController < ApplicationController

	def show
		@forum_topic = ForumTopic.find(params[:id])
		@forum_post = @forum_topic.forum_posts
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
		@forum_topic = ForumTopic.find(params[:id])
	end

	def update
		find_forum_topic
	    if @forum_topic.update(forum_topic_params)
	      flash[:success] = "Tópico atualizado!"

	      redirect_to @forum_topic
	    else
	      render :edit
	    end
  	end

	def destroy 
		find_forum_topic
		@forum_topic.destroy
		redirect_to forum_topic_path
	end

	private

  	def forum_topic_params
	    	params.require(:forum_topic).permit(:title, :body, :author)
	end

end
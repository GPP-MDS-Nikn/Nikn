class ForumTopicsController < ApplicationController

	def index
		@forum_topic = ForumTopic.all
	end

	def new
		@forum_topic = ForumTopic.new
	end

	def create
		@forum_topic = ForumTopic.new(forum_topic_params)

		if @forum_topic.save
			redirect_to @forum_topic
		else
			render 'new'
		end
	end

	private

	  	def forum_topic_params
	    	params.require(:forum_topic).permit(:title, :body, :author)
	  	end

end
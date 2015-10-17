class ForumTopicsController < ApplicationController

	def index
		@forum_topic = ForumTopic.all
	end



end
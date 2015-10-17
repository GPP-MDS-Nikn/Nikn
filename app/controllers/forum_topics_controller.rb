class ForumTopicsController < ApplicationController

	def index
		@topic = Topic.all
	end



end
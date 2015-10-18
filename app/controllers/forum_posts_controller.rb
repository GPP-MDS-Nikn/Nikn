class ForumPostsController < ApplicationController
	
	def index
	end

	def new
		@post = ForumPost.new
	end

	def create
		@post = ForumPost.new(post_params)
	end

private 

	def post_params
		params.require(:forum_posts).permit(:title, :content)
	end


end
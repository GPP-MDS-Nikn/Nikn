class ForumPostsController < ApplicationController
	
	def index
	end

	def new
		@forum_post = ForumPost.new
	end

	def show
		@forum_post = ForumPost.find(params[:id])
	end

	def create
		@forum_post = ForumPost.new(forum_post_params)

		if @forum_post.save
			redirect_to @forum_post
		else
			render 'new'
		end
	end

private 

	def forum_post_params
		params.require(:forum_post).permit(:title, :content)
	end


end
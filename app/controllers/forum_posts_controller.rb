class ForumPostsController < ApplicationController
	#before_action :find_forum_post, only: [:show, :edit, :update, :destroy]
	
#	def index
#		@forum_posts = ForumPost.all.order("created_at DESC")
#	end
#
#	def new
#		@forum_topic = ForumTopic.find(params[:forum_topic_id])
#		@forum_post = @forum_topic.forum_posts.build
#	end

	def create
		find_forum_topic
		@forum_post = @forum_topic.forum_posts.create(forum_post_params)
		@forum_post.save
		if @forum_post.save
			redirect_to @forum_topic
		else
			render 'new'
		end
	end

	def edit
		find_forum_topic
		@forum_post = @forum_topic.forum_posts.find(params[:id])

	end

	def update
		find_forum_topic
		@forum_post = @forum_topic.forum_posts.find(params[:id])

		if @forum_post.update(forum_post_params)
			redirect_to @forum_topic
		else
			render 'edit'
		end
	end

	def destroy
		find_forum_topic
		@forum_post = @forum_topic.forum_posts.find(params[:id])
		@forum_post.destroy
		redirect_to @forum_topic
	end

private 

	def find_forum_post
		@forum_post = ForumPost.find(params[:id])
	end

	def find_forum_topic
		@forum_topic = ForumTopic.find(params[:forum_topic_id])
	end


	def forum_post_params
		params.require(:forum_post).permit(:content)
	end


end
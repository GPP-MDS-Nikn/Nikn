class ForumPostsController < ApplicationController
	def create
	    @forum_topic = ForumTopic.find(params[:forum_topic_id])
		@forum_post = @forum_topic.forum_posts.build(forum_post_params)
		@forum_post.save
		if @forum_post.save
			flash[:success] = "Postagem criada com sucesso."
			redirect_to forum_topic_path(@forum_topic)
		else
			flash[:warning] = "A postagem precisa ter pelo menos 2 caracteres e no máximo 1000."
			redirect_to forum_topic_path(@forum_topic)
		end
	end

	def edit
		@forum_topic = ForumTopic.find(params[:forum_topic_id])
    	@forum_post = ForumPost.find(params[:id])

	end

	def update
		@forum_topic = ForumTopic.find(params[:forum_topic_id])
    	@forum_post = ForumPost.find(params[:id])

		if @forum_post.update(forum_post_params)
			redirect_to @forum_topic
		else
			render 'edit'
		end
	end

	def destroy
		@forum_topic = ForumTopic.find(params[:forum_topic_id])
    	@forum_post = ForumPost.find(params[:id])
		@forum_post.destroy
		redirect_to @forum_topic
	end

private 

	def find_forum_post
		@forum_post = ForumPost.find(params[:id])
	end



	def forum_post_params
		params.require(:forum_post).permit(:content)
	end


end
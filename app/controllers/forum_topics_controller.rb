class ForumTopicsController < ApplicationController
	before_action :find_topic, :only => [:new_report_topic, :create_report_topic]
	before_action :find_post, :only => [:new_report_post, :create_report_post]

	def show
  		@forum_theme = ForumTheme.find(params[:forum_theme_id])
		@forum_topic = ForumTopic.find(params[:id])
		@forum_posts = @forum_topic.forum_posts
  	end

  	def new
  		@forum_theme = ForumTheme.find(params[:forum_theme_id])
  		@forum_topic = @forum_theme.forum_topics.build
  	end


	def create
		@forum_theme = ForumTheme.find(params[:forum_theme_id])
		@forum_topic = @forum_theme.forum_topics.build(forum_topic_params)
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
		@forum_topic = ForumTopic.find(params[:id])
	    if @forum_topic.update(forum_topic_params)
	      flash[:success] = "Tópico atualizado!"

	      redirect_to forum_topic_path
	    else
	      render :edit
	    end
  	end

	def destroy
		@forum_theme = ForumTheme.find(params[:forum_theme_id])
		@forum_topic = ForumTopic.find(params[:id])
		@forum_topic.destroy
		redirect_to @forum_theme
	end

	def new_report_post
		find_post
	end

	def create_report_post
		find_post
		if verify_recaptcha
			@forum_post.reports += 1
			@forum_post.save
			flash[:success] = "Uhuul!"
			redirect_to forum_theme_forum_topic_path(@forum_theme, @forum_topic)
		else
			redirect_to new_report_post_path
	      	flash[:warning] = "captcha bugado!"
		end
	end

	def new_report_topic
	end

	def create_report_topic
		if verify_recaptcha
			@forum_topic.reports += 1
			@forum_topic.save
			flash[:success] = "Uhuul!"
			redirect_to forum_theme_forum_topic_path(@forum_theme, @forum_topic)
		else
			redirect_to new_report_topic_path
	      	flash[:warning] = "captcha bugado!"
		end
	end

	def report_topic
		@forum_topic = ForumTopic.find(params[:id])
		@forum_topic.reports += 1
		@forum_topic.save
	end

	private

  	def forum_topic_params
	    	params.require(:forum_topic).permit(:title, :body, :author, :forum_theme_id)
	end

	def find_post
		@forum_post = ForumPost.find(params[:id])
		@forum_theme = ForumTheme.find(params[:id])
		@forum_topic = ForumTopic.find(params[:id])
	end

	def find_topic
		@forum_theme = ForumTheme.find(params[:id])
		@forum_topic = ForumTopic.find(params[:id])
	end
end

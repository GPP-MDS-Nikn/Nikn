class PortalPostsController < ApplicationController
	def list
		@portal_posts = PortalPost.all
	end
	def new
		@portal_post = PortalPost.new
	end
	def create
    @portal_post = PortalPost.new(portal_post_params)
    if @portal_post.save
      redirect_to '/portal/list'
    else
      render 'new'
    end
  end
  
  private 
  	def portal_post_params
		params.require(:portal_post).permit(:author,:title,:content)
  end
end
class PortalPostsController < ApplicationController
  before_action :set_portal_post, only: [:edit, :update, :destroy]

  # GET /portal_posts
  def index
    @portal_posts = PortalPost.all
  end
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
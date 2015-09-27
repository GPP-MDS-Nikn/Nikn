class PortalPostsController < ApplicationController
  before_action :set_portal_post, only: [:edit, :update, :destroy]

  # GET /portal_posts
  def index
    @portal_posts = PortalPost.all
	end
  
  # GET /portal_posts/new
  def new
    @portal_post = PortalPost.new
  end
  
  # POST /portal_posts 
  def create
    @portal_post = PortalPost.new(portal_post_params)
    
    if @portal_post.save
      redirect_to '/portal_posts', notice: 'Postagem criada com sucesso.'
    else
      render :new
    end
  end
  
  private 
    def portal_post_params
      params.require(:portal_post).permit(:author, :title, :body)
    end
end
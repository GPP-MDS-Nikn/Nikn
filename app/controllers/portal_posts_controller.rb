class PortalPostsController < ApplicationController
  before_action :set_portal_post, only: [:show, :edit, :update, :destroy]

  # GET /portal_posts
  def index
    @portal_posts = PortalPost.all
	end
  
  # GET /portal_posts/<post:id>
  def show
  end

  # GET /portal_posts/new
  def new
    @portal_post = PortalPost.new
  end
  
  # GET /portal_posts/<post:id>/edit
  def edit
  end
  
  # POST /portal_posts 
  def create
    @portal_post = PortalPost.new(portal_post_params)
    
    if @portal_post.save
      redirect_to portal_posts_url, notice: 'Postagem criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /portal_posts/<post:id>
  def update
    if @portal_post.update(portal_post_params)
      redirect_to @portal_post, notice: 'Postagem atualizada com sucesso.'
    else
      render :edit
    end
  end
  
  # DELETE /portal_posts/<post:id>
  def destroy
    @portal_post.destroy
    redirect_to portal_posts_url, notice: 'Postagem excluída com sucesso.'
  end

  private 
    def set_portal_post
      @portal_post = PortalPost.find(params[:id])
    end

    def portal_post_params
      params.require(:portal_post).permit(:author, :title, :body)
    end
end
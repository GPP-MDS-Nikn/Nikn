class PortalPostsController < ApplicationController
  before_action :set_portal_post, only: [:show, :edit, :update, :destroy]

  # Use this controller as a resource of CanCan and Rolify
  load_and_authorize_resource

  # GET /portal_posts
  def index
    @portal_posts = PortalPost.all
    if params[:search]
      @portal_posts = PortalPost.search(params[:search]).order("created_at DESC")
    else
      @portal_posts = PortalPost.all.order('created_at DESC')
    end
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

    # Associate the portal_post created along with its owner
    @portal_post.ong_id = current_ong.id 

    if @portal_post.save
      flash[:success] = "A postagem \"#{ @portal_post.title }\" foi criada com sucesso."
      redirect_to portal_posts_url
    else
      render :new
    end
  end

  # PATCH/PUT /portal_posts/<post:id>
  def update
    if @portal_post.update(portal_post_params)
      flash[:success] = "A postagem \"#{ @portal_post.title }\" foi atualizada com sucesso."

      redirect_to @portal_post
    else
      render :edit
    end
  end

  # DELETE /portal_posts/<post:id>
  def destroy
    @portal_post.destroy
    redirect_to portal_posts_url
  end

  private
    def set_portal_post
      @portal_post = PortalPost.find(params[:id])
    end

    def portal_post_params
      params.require(:portal_post).permit(:author, :title, :body, :image_file)
    end
end

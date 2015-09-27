class PortalPostsController < ApplicationController
  before_action :set_portal_post, only: [:show, :edit, :update, :destroy]

  # GET /portal_posts
  def index
    @portal_posts = PortalPost.all
	end

  # GET /portal_posts/<post:id>
  def show
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

      redirect_to '/portal_posts', notice: 'Postagem criada com sucesso.'
    else
      render 'new'
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
    params.require(:portal_post).permit(:author,:title,:content)
    end
end
class PortalPostsController < ApplicationController
	before_action :set_portal_post, only: [:edit, :update, :destroy]

  # GET /portal_posts
  def index
    @portal_posts = PortalPost.all
	end

end
module Api
  module V1
    class PortalPostsController < ApplicationController
      respond_to :json

      def index
        respond_with PortalPost.all
      end

      def show
        respond_with PortalPost.find(params[:id])
      end
    end
  end
end

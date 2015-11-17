module Api
  module V1
    class EventsController < ApplicationController
      respond_to :json

      def index
        respond_with Event.all
      end

      def show
        respond_with Event.find(params[:id])
      end
    end
  end
end

module Api
  module V1
    class CareUnitsController < ApplicationController
      respond_to :json

      def index
        respond_with CareUnit.all
      end

      def show
        respond_with CareUnit.find(params[:id])
      end

    end
  end
end

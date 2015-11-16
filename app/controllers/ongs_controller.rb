class OngsController < ApplicationController
	before_action :authenticate_ong!
	
  def index
    @ong = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
  end
end

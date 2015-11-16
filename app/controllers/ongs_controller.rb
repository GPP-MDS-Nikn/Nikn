class OngsController < ApplicationController
	before_action :authenticate_user!
	
  def index
    @ong = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
  end
end

class OngsController < ApplicationController
	skip_authorization_check
	
	# Use this controller as an user od CanCan and Rolify
	before_action :authenticate_ong!

  def index
    @ong = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
  end
end

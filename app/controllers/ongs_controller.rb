class OngsController < ApplicationController
  def index
    @ong = Ong.all
  end

  def show
    @ong = Ong.find(params[:id])
  end
end

class OngsController < ApplicationController
  
  def index
    @ongs = Ong.all
  end

end
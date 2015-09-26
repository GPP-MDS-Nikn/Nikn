class OngsController < ApplicationController
  
  #Display ongs on database
	def index
    @ong = Ong.all  
  end
  #Display individual ongs when selected
  def show
    @ong = Ong.find(params[:id])
  end

  
  #new and create shall add new ongs to database
  def new
  		@ong = Ong.new
  	end
  #..
  def create 
  	  @ong = Ong.new(ong_params) 
    if @ong.save 
    	redirect_to '/ongs' 
    else 
    	render 'new' 
    end
  end
  #edit ongs on database
  def edit
    @ong = Ong.find(params[:id])
  end
  #update database for edited ongs
  def update
    @ong = Ong.find(params[:id])
      if @ong.update(ong_params)
        redirect_to @ong
      else
        render 'edit'
      end
  end

  def destroy
    Ong.find(params[:id]).destroy
    flash[:success] = "Ong deleted"
    redirect_to ongs_url

  end

  	private
#the private method ong_params determine what will be created from the fields on new.html.erb, the 'new' page.
	def ong_params
		params.require(:ong).permit(:name, :adress)
	end
end
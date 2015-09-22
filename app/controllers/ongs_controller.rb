class OngsController < ApplicationController
  
	def index
    
  	end
  	#new and create shall add new ongs to database
	def new
  		@ong = Ong.new
  	end
  	
  	def create 
	  @ong = Ong.new(ong_params) 
	  if @ong.save 
	  	redirect_to '/ongs' 
	  else 
	  	render 'new' 
	  end
  	end 
  	#the private method ong_params determine what will be created from the fields on new.html.erb, the 'new' page.
  	private

	def ong_params
		params.require(:ong).permit(:name, :adress)
	end
end
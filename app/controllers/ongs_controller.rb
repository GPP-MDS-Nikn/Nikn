class OngsController < ApplicationController
  
	def index
    @ong = Ong.all  
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

  def edit
    @ong = Ong.find(params[:id])
  end

  def update
    @ong = Ong.find(params[:id])
      if @ong.update(ong_params)
        redirect_to @ong
      else
        render 'edit'
      end
  end
  end

  	private
#the private method ong_params determine what will be created from the fields on new.html.erb, the 'new' page.
	def ong_params
		params.require(:ong).permit(:name, :adress)
	end
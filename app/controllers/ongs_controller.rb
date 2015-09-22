class OngsController < ApplicationController
  

	def index
    
  	end
  	#This shall add new ongs to database
	def new
  		@ong = Ong.new
  	end

end
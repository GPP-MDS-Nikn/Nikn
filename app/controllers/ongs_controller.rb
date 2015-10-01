class OngsController < ApplicationController

	def index
		@ong = Ong.all
	end

end

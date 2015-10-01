class PageController < ApplicationController

	def home
		@ong = Ong.all
	end

	def about
	end

	def contact
	end

end


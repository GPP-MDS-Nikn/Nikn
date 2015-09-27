class EventsController < ApplicationController
	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			# Criar uma página para autenticações com sucesso
		else
			render 'new'
		end
	end

	private

		def event_params
			return params.require(:event).permit(:name, :local, 
								  :description, :date, :photo_path)
		end
end
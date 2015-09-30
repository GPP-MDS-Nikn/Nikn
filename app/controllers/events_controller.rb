class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		# This is a useful way to make a individual page
		# to each event registered at database
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	# editar evento preexistente
	def edit
		@event = Event.find(params[:id])
		#user validation is here
	end

	def create
		# Construct with permitted params
		@event = Event.new(event_params)

		if @event.save

			# Display a success message after render the next page
			flash[:success] = "O evento \"#{ @event.name }\" foi criado com sucesso."

			# We could have used the equivalent
			# redirect_to @event
			redirect_to event_url(@event)
		else
			# If the form contains one or more erros,
			# the alternative flux renders a new form page
			# with some error indicators.
			# This is implemented @ /app/views/shared/_error_messages.html.erb
			render 'new'
		end
	end

	private

		# For security, we have to block the access to some
		# parts of our db tables, so, Rails ( > 4.0) implements
		# a way to describe which fields could be written.
		def event_params
			return params.require(:event).permit(:name, :local,
								  :description, :date, :image_file)

		end
end
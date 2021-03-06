class EventsController < ApplicationController
	# Tells rails to execute set_event method inside each method in symbol list.
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	# Use this controller as a resource of CanCan and Rolify
  load_and_authorize_resource

	def index
		@events = Event.all

		# Find the five next events
		@next_five_events = Event.where("start_time >= :start_date AND end_time <= :end_date",
			{start_date: DateTime.now, end_date: 10.days.from_now})
	end

	def show
		# This is a useful way to make a individual page
		# to each event registered at database
	end

	def new
		@event = Event.new
	end

	# editar evento preexistente
	def edit
		#@event = Event.find(params[:id])
		#user validation is here
	end

	def create
		# Construct with permitted params
		@event = Event.new(event_params)

		# Associate the created event along with its owner
    @event.ong_id = current_ong.id

		if @event.save

			# Display a success message after render the next page
			flash[:success] = "O evento \"#{ @event.title }\" foi criado com sucesso."

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

	def update
		if @event.update(event_params)
      redirect_to @event
      flash[:success] = "O evento \"#{ @event.title }\" foi atualizado com sucesso."
    else
      render :edit
    end
	end

	def destroy
    @event.destroy
    redirect_to events_url, notice: 'Evento excluído com sucesso.'
  end

	private
		def set_event
      @event = Event.find(params[:id])
    end
		# For security, we have to block the access to some
		# parts of our db tables, so, Rails ( > 4.0) implements
		# a way to describe which fields could be written.
		def event_params
			return params.require(:event).permit(:title, :local, :description, :start_time, :end_time, :image_file)

		end
end
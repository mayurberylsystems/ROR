class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
	end

	def create
		@event = Event.new(event_params)
     	if @event.save
      		redirect_to events_path
    	else
      		render 'new'
      		flash[:notice] = "Didn't work"
    	end
	end

	def show
		@event = Event.find(event_params)
	end

	private
	def events_params
		params.require(:event).require(:name)
	end
end

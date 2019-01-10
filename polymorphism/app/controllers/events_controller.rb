class EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
	end

	def create
		@event = Event.new(event_params)
     	@event.save
      	redirect_to events_path
	end

	def show
		@event = Event.find(event_params)
	end

	private
	def event_params
		params.require(:event).permit(:name)
	end
end

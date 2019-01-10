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
		@event = Event.find(params[:id])
	end
	
	def edit
		@event = Event.find(params[:id])
	end
	
	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to events_path
		else 
			render 'edit'
		end
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
		redirect_to events_path
	end

	def event_params
		params.require(:event).permit(:name,:location)
	end
end

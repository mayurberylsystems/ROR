class DoctorsController < ApplicationController
	def new
	end

	def index
		@doctor=Doctor.all
	end

	def create
		@doctor=doctor.new(doctor_params)
    	@doctor.save
    	redirect_to doctors_path 
	end

	def show
		@doctor=Doctor.find(params[:id])
	end

  


  private
  def doctor_params
  	params.require(:doctor).permit(:name,:age,:contact)
  end	


end

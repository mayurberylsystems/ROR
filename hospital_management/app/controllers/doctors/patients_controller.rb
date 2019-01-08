class Doctors::PatientsController < ActionController::Base
	def index
		@patient = Patient.all
	end
	
	def new
  end

  def create
    @patient = Patient.new(patient_params)
  	@patient.save
  	redirect_to doctors_patients_path 
  end

  def show
   	@patient = Patient.find(params[:id])
  end

  
  private
  
  def patient_params
  	params.require(:patient).permit(:name,:age,:address)
  end

end

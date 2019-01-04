class PatientsController < ApplicationController
	def index
		@patient=Patient.all
	end
	
	def new
    end

    def create
    	@patient=Patient.new(patient_params)
    	@patient.save
    	redirect_to patients_path 
    end

    def edit
    	@patient = Patient.find(params[:id])
    end

    def destroy
    	@patient = Patient.find(params[:id])
    	@patient.destroy
    	redirect_to patients_path
    end
    def update
    	@patient = Patient.find(params[:id])
    	if @patient.update(patient_params)
    		redirect_to @patient
    	else
    		render 'edit'
    	end
    end

  private
  def patient_params
  	params.require(:patient).permit(:name,:age,:contact,:address)
  end
end

end

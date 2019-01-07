class Doctors::DoctorsController < ApplicationController

  def index
    doctor=current_doctor
    @patientslist = doctor.patients
  end
  
  def after_sign_in_path(resource)
    doctors_doctors_path
  end

  def sign_up
    debugger
  end


  def edit
    doctor=current_doctor
    @patientslist = doctor.patients.find(params[:id])
  end

  def update
    doctor=current_doctor
    @patientslist = doctor.patients.find(params[:id])
    if @patientslist.update(doctor_params)
      redirect_to @patientslist
    else
      render 'edit'
    end
  end

    private
    
    def doctor_params
      params.require(:doctor).permit(:first_name,:last_name,:contact,:address,:city,:state)
    end
end

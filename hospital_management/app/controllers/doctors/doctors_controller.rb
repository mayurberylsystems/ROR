class Doctors::DoctorsController < ApplicationController

  def index
    d=current_doctor
    @doctor = d.patients
  end
  
  def after_sign_in_path(resource)
    doctors_doctors_path
  end

  def edit
    d=current_doctor
    @doctor = d.patients.find(params[:id])
  end

  def update
    d=current_doctor
    @doctor = d.patients.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
    d=current_doctor
    @doctor = d.patients.find(params[:id])
    @doctor.destroy
    redirect_to doctors_doctors_path
 end

    private
    
    def doctor_params
      params.require(:doctor).permit(:first_name,:last_name,:contact,:address,:city,:state)
    end
end

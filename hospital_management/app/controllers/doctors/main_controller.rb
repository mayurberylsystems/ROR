class Doctors::MainController < ApplicationController
	before_action :authenticate_doctor!
end

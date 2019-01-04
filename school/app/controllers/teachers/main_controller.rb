class Teachers::MainController < ApplicationController
	before_action :authenticate_teacher!
end

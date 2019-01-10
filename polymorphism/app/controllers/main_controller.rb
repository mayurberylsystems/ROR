class MainController < ApplicationController
	before_action :authenticate_enduser!
end

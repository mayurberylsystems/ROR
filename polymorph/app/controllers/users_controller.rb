class UsersController < ApplicationController
	
	def index
		@users = User.all
	end
	
	def new
	end
	
	def create
		@user = User.new(user_params)
		@user.save
		redirect_to users_path
	end
	
	def show
		@user = User.find(params[:id])
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to users_path
		else 
			render 'edit'
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to users_path
	end

	def user_params
		params.require(:user).permit(:name,:email)
	end
end

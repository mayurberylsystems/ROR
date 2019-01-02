class DpostsController < ApplicationController
  def index
  	@dpost=Dpost.all
  end

  def new
  end

  def edit
  	@dpost = Dpost.find(params[:id])
  end

  def update
  	@dpost = Dpost.find(params[:id])
  	if @dpost.update(dpost_params)
  		redirect_to @dpost
  	else
  		render 'edit'
  	end
  end

  def create
  	#render plain: params[:dpost].inspect
  	@dpost=Dpost.new(dpost_params)
  	@dpost.save
  	redirect_to @dpost  
  end

  def show
  	@dpost=Dpost.find(params[:id])
  end

  private
  def dpost_params
  	params.require(:dpost).permit(:name,:title,:content)
  end

end

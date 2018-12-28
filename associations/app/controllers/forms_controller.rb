class FormsController < ApplicationController
  def index
  	@form = Form.all
  end

  def new
  end

  def show
  	@form = Form.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
  	@form = Form.new(form_params)
  	@form.save
  	redirect_to new_form_path
  end

  def delete
  end 


  private
  def form_params
  	params.require(:form).permit(:name,:address,:email,:queries)
  end
end

class Admin::ProductCategoriesController < ApplicationController

  def change_category
    #parent = Category.where("name ilike ?", params[:catg_id])[0]
    @categories = Category.where("parent_id = ?", params[:catg_id])
  end

  def upload_csv
    unless params[:csv_file].blank?
      csv = CSV.read(params[:csv_file].path, headers: true)
      header = csv.headers[0]
      data = csv[header]
      @names = csv[header].join(', ')
    end
  end

  def create
    if params[:csv_file].blank?
      ProductCategory.create(category_params)
      flash[:success] = "Product Category saved successfully!"
    else
      csv = CSV.read(params[:csv_file].path, headers: true)
      header = csv.headers[0]
      #csv.headers.each do |header|
        data = csv[header]
        data.each do |catg_name|
          catg = ProductCategory.new(category_params)
          catg.name = catg_name
          catg.save
        end
      #end
      flash[:success] = "File uploaded successfully!"
    end
  end

  private
  def category_params
    params.require(:product_category).permit(:name, :description, :category_id, :sub_category_id)
  end
end

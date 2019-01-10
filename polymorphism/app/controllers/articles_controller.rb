class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
	end

	def create
		@article = Article.new(article_params)
     	if @article.save
      		redirect_to doctors_articles_path
    	else
      		render 'new'
      		flash[:notice] = "Didn't work"
    	end
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).require(:name)
	end
end

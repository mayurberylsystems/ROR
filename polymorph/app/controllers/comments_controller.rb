class CommentsController < ApplicationController
	
	def index
		@comments = Comment.all
	end
	
	def new
	end
	
	def create
		@comment = Comment.new(comment_params)
		@comment.save
		redirect_to comments_path
	end
	
	def show
		@comment = Comment.find(params[:id])
	end
	
	def edit
		@comment = Comment.find(params[:id])
	end
	
	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to comments_path
		else 
			render 'edit'
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to comments_path
	end

	def comment_params
		params.require(:comment).permit(:opinion,:user_id,:commentable_id,:commentable_type)
	end
end

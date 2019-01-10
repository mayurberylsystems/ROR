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


	private
	def comment_params
		params.require(:comment).permit(:commentable_id , :commentable_type , :created_at , :updated_at, :yourcomments  )
	end
end

class CommentsController < MainController
	def index
		@comments = current_signeduser.comments
	end

	def new
	end

	def create
		@comment = current_signeduser.comments.new(comment_params)
     	if @comment.save
      		redirect_to comments_path
    	else
      		render 'new'
      		flash[:notice] = "Didn't work"
    	end
	end

	def show
		@comment = current_signeduser.comments.find(params[:id])
	end

	private
	def comment_params
		params.require(:comment).require(:commentable_id , :commentable_type , :yourcomments)
	end
end

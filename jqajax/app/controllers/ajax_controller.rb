class AjaxController < ApplicationController
  
  def index
  	# @socialmedia = Socialmedia.create(name:  , total_users: )
  end

  def new 
  end

  def create
  	@post = Post.new(post_params)
  	@post.save
  end

  def save_accounts
  end

  def post_params
  	params.require(:post).permit(:content,:facebook,:twitter, :instagram, :gmail)
  end
end

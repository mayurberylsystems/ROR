module Api
	module V1
		class PostsController < ApplicationController
			def index
				posts = Post.all
				render json: posts
			end

			def show
				post = Post.find(params[:id])
				render json: post
			end

			def create
				post = Post.new(post_params)

				if post.save
					render json: {status: 'SUCCESS', message: 'Saved Post by Admin', data:post}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Post Not Saved Yet', data:post.errors}, status: :unprocessable_entity
				end
			end 

			def destroy
				post = Post.find(params[:id])
				post.destroy
				render json: {status: 'SUCCESS', message: 'Deleted Post', data:post}, status: :ok
			end

			private

			def post_params
				params.permit(:title, :content)
			end
		end
	end
end
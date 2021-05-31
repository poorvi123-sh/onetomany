class PostsController < ApplicationController
	def index
		@posts=Post.where(user_id:params[:user_id])
	end
	def new
		@user=User.find_by(params[:user_id])
		@user.posts.build
	end

	def create
	@user=User.find_by(params[:user_id])
	@post=@user.posts.build(post_params)
	@post.save
	redirect_to users_path

	end

	private
	def post_params
		params.require(:post).permit(:description,:body,:user_id)
	end
end

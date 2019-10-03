class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		send_data @post.photo, :type => @post.ctype, :disposition => 'inline'
	end


	private
	def post_params
		if params[:post][:photo]
			params[:post][:ctype] = params[:post][:photo].content_type
			params[:post][:photo] = params[:post][:photo].read
		end
		params.require(:post).permit(:title, :ctype, :photo)
	end
end

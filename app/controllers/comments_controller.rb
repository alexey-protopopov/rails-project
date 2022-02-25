class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		if logged_in?
			my_params = comment_params
			my_params[:username] = current_user.username
			@comment = @post.comments.create(my_params)
			redirect_to post_path(@post)
		else
			redirect_to post_path(@post)
		end
	end	

	private def comment_params
		params.require(:comment).permit(:body)
	end
end

class PagesController < ApplicationController
  def about
  end

  def profile
  	@user = User.where("username = ?", params[:username]).first
  	if @user
  		@name = @user.username
  		@reg_date = @user.created_at.strftime("%d-%m-%Y %H:%M")
  		@all_posts = Post.where("author = ?", @name)
  		@all_comments = Comment.where("username = ?", @name)
  		@posts_count = @all_posts.length
  		@comments_count = @all_comments.length
  	else
  		render_404
  	end
  end

  def render_404
  	redirect_to '/404'
  end

  private def page_params
    params.require(:page).permit(:username)
  end
end

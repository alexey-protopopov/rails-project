class SessionsController < ApplicationController
	def create
		@login_success = 0
  		user = User.find_by(username: params[:session][:username])
  		if user && user.authenticate(params[:session][:password])
    		session[:user_id] = user.id
    		@login_success = 1
    		redirect_to posts_path
  		else
  			@login_success = -1
    		render 'new'
  		end
	end
 
	def destroy
  		session[:user_id] = nil
  		redirect_to login_path
	end
end
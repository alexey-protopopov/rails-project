class UsersController < ApplicationController
	def new
		@user = User.new
	end

 	def create
   		@user = User.new(user_params)
   		render 'new'
 	end
 	
 	def edit
 		if session[:id] == nil
 			#
 		else
 			redirect_to login_path
 		end
 	end

	private
 
 	def user_params
  	 	params.require(:user).permit(:username, :password)
 	end	
end
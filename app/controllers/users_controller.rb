class UsersController < ApplicationController
	def index
		@user = "asdfas"
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
    	if @user.save
      		redirect_to @user
    	else
      		render new_user_path
    	end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update
		if @user.save
			redirect_to @user
		else
			redirect_to root_path
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
 		redirect_to root_path
	end

	def about
		# just a path
	end


	private

 	def user_params
 		params.require(:user).permit(:username, :password, :email)
 	end


end
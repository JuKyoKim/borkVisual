class UsersController < ApplicationController

	before_filter :authorize, :except => [:index, :new, :create]

	def index
	end

	def show
		@user = User.find(params[:id])

		@all_url = []
    	Bookmark.where(user_id: @current_user.id).find_each do |bookmark|
      		@all_url.push({
        		"name" => bookmark.name,
        		"url" => bookmark.url,
        		"id" => bookmark.id
      		})
    	end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
    	if @user.save
    		session[:user_id] = @user.id
      		redirect_to @user
    	else
      		redirect_to root_path
    	end
	end

	def edit
		@user = User.find(@current_user.id)
	end

	def update
		@user = User.find(@current_user.id)
		if @user.update_attributes(user_params)
			redirect_to @user
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
 		redirect_to root_path
	end

	def about
	end


	private

 	def user_params
 		params.require(:user).permit(:username, :email, :password, :password_confirmation)
 	end


end

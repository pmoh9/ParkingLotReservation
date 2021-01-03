class UsersController < ApplicationController
	
	skip_before_action :authorized, only: [:new, :create]

	def new
    	@user = User.new
  	end

  	def create
		@user = User.create(params.require(:user).permit(:name, :email, :password, :password_confrimation))
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_vehicles_path(@user.id)
		else
			flash[:danger] = "Error creating User! Please try again."
			redirect_to new_user_path()
		end
  	end
end

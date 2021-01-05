class SessionsController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]
  
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        if @user.admin == true
          redirect_to admin_url
        else
          redirect_to user_vehicles_path(@user.id)
        end
    else
        flash[:danger] = "Error logging in!"
        render 'new'
    end
  end

  def destroy  
    session[:user_id] = nil         
    render 'new'
  end  
end

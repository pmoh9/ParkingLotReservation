class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
  end
  
  def index
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @vehicle = Vehicle.find_by(params[:veh_id])
    @transaction = @user.@vehicle.transactions.new(transaction_params)
    if @transaction.save
	redirect_to user_vehicle_path(@user.id)
    else
	flash[:danger] = "Unable to book Slot!"
	render 'new'
    end
  end
end

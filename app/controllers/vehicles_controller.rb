class VehiclesController < ApplicationController
	def new
		@vehicle = Vehicle.new
	end

	def create
		@user = User.find_by(id: session[:user_id])
		@vehicle = @user.vehicles.new(vehicle_params)
		if @vehicle.save
			redirect_to user_vehicles_path(@user.id)
		else
			flash[:danger] = "Error! Unable to add Vehicle"
			render 'new'
		end
	end

	def destroy
		@user = User.find_by(id: session[:user_id])
		@vehicle = Vehicle.find(params[:id])
		@vehicle.destroy
        	redirect_to user_vehicles_path(@user.id)
	end
  
	private
		def vehicle_params
			params.require(:vehicle).permit(:vehnumber, :vehtype, :vehname)
		end
	
end

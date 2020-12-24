class VehiclesController < ApplicationController
	def new
		@vehicle = Vehicle.new
	end

	def create
		@user = User.find_by(id: session[:user_id])
		@vehicles = @user.vehicles.create(vehicle_params)
		redirect_to user_vehicles_path(@user.id)
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

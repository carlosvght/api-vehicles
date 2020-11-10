class VehiclesController < ApplicationController
  protect_from_forgery with: :null_session
  
  def index
    @vehicles = Vehicle.all
    render json: @vehicles
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def new
    @vehicle = Vehicle.new
  end
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end
  
  def create
    @vehicle = Vehicle.new(vehicle_params)
    
    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
  end
  
  
  private
  
  def vehicle_params
    params.permit(:car, :brand, :year, :description, :sold)  
  end
end
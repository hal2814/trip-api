class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  def index
    @trips = Trip.all.paginate(page: params[:page], per_page: 10)
  end

  def distance
    @trips = Trip.order_by_distance.paginate(page: params[:page], per_page: 10)
  end

  def highest
    @max_speed_trip = Trip.max_speed_trip
  end

  def create
    @trip = Trip.create!(trip_params)
    json_response(@trip, :created)
  end

  def show
    json_response(@trip)
  end

  def update
    @trip.update(trip_params)
    head :no_content
  end

  def destroy
    @trip.destroy
    head :no_content
  end

  private

  def trip_params
    params.permit(:trip_id_number, :start, :stop, :status, :vehicleId, :deviceId)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end

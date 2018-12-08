class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]
  include TripsHelper

  def index
    get_data_set('trips')
    @trips = Trip.all
    # json_response(@trips)
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

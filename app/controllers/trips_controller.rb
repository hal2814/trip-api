class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  def index
    # @trips = Trip.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @trips = Trip.joins(:stats).order('stats.distance::float DESC').paginate(page: params[:page], per_page: 10)
    max_speed_stat = Stat.where(max_speed: Stat.maximum("max_speed::integer"))
    @max_speed_trip = Trip.where(id: max_speed_stat.first.trip_id).first
    # json_response(@trips)
  end

  def create
    @trip = Trip.create!(trip_params)
    # json_response(@trip, :created)
  end

  def show
    # json_response(@trip)
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

class StatsController < ApplicationController
  before_action :set_trip
  before_action :set_trip_stat, only: [:show, :update, :destroy]

  def index
    @stats = Stat.all.order("distance::float DESC").paginate(page: params[:page], per_page: 10)
    # json_response(@trip.stats)
  end

  def show
    # json_response(@stat)
  end

  def create
    @trip.stats.create!(stat_params)
    # json_response(@trip, :created)
  end

  def update
    @stat.update(stat_params)
    head :no_content
  end

  def destroy
    @stat.destroy
    head :no_content
  end

  private

  def stat_params
    params.permit(:max_speed, :distance)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_trip_stat
    @stat = @trip.stats.find_by!(id: params[:id]) if @trip
  end
end

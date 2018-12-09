class Trip < ApplicationRecord
  has_many :stats, dependent: :destroy

  scope :max_speed_trip, -> { where(id: Stat.where(max_speed: Stat.maximum("max_speed::integer")).first.trip_id).first }
  scope :order_by_distance, -> { joins(:stats).order('stats.distance::float DESC') }

  validates_presence_of :trip_id_number, :start, :stop, :status, :vehicleId, :deviceId
end

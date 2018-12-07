class Trip < ApplicationRecord
  has_many :stats, dependent: :destroy

  validates_presence_of :trip_id, :start, :stop, :status, :vehicleId, :deviceId
end

class Trip < ApplicationRecord
  has_many :stats, dependent: :destroy

  validates_presence_of :trip_id_number, :start, :stop, :status, :vehicleId, :deviceId
end

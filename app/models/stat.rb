class Stat < ApplicationRecord
  belongs_to :trip

  validates_presence_of :max_speed, :distance
end

require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:stats).dependent(:destroy) }
  it { should validate_presence_of(:trip_id) }
  it { should validate_presence_of(:start) }
  it { should validate_presence_of(:stop) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:vehicleId) }
  it { should validate_presence_of(:deviceId) }
end

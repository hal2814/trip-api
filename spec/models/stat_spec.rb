require 'rails_helper'

RSpec.describe Stat, type: :model do
  it { should belong_to(:trip) }
  it { should validate_presence_of(:max_speed) }
  it { should validate_presence_of(:distance) }
end

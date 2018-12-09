require 'rails_helper'

RSpec.describe 'Logging in', type: :request do
  let!(:users) { create(:user) }
  let!(:trips) { create(trip_id_number: '123abc', start: '456', stop: '789', status: 'completed', vehicleId: 'g872', deviceId: 'fsd456') }
  let(:trip_id) { trips.first.id }

  visit ('/')
  click_link "Login"
  fill_in "user_email", with: 'user@trip.com'
  click('Log in')
  page.should have_content('123abc')

end

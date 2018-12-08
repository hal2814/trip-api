require 'open-uri'

def json_to_hash
  data = JSON.load(open(ENV["trip_api_url"]))
end

def get_data_set(top_level)
  data = json_to_hash
  data[top_level].each do |trip|
    current = Trip.create(trip_id_number: trip["id"], start: trip["start"], stop: trip["stop"], status: trip["status"], vehicleId: trip["vehicleId"], deviceId: trip["deviceId"])
    Stat.create(max_speed: trip["stats"]["maxSpeed"], distance: trip["stats"]["distance"],trip_id: current.id)
  end
end

namespace :trips do
  desc "grab json data"
  task :pull_data  => [ :environment ] do
    puts "pulling JSON data..."
    get_data_set('trips')
  end
end

include TripsHelper

namespace :trips do
  desc "grab json data"
  task :pull_data  => [ :environment ] do
    get_data_set('trips')
  end
end

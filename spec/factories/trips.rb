FactoryBot.define do
  factory :trip do
    trip_id_number { Faker::Number.number(7) }
    start { Faker::Number.number(3) }
    stop { Faker::Number.number(3) }
    status { "completed" }
    vehicleId { Faker::Number.number(10) }
    deviceId { Faker::Number.number(5) }
  end
end

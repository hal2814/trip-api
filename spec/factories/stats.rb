FactoryBot.define do
  factory :stat do
    max_speed { Faker::Number.between(50,85) }
    distance { Faker::Number.number(4) }
    trip { nil }
  end
end

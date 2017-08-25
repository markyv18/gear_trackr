FactoryGirl.define do
  factory :gear do
    name {Faker::DrWho.quote}
    total_distance_in_meters {Faker::DrWho.specie }
    total_time_in_seconds {Faker::Number.between(1, 100000000)}
    last_search_date {Faker::Date.backward(750)}
    # users_id :user
    # users_id { [association(:user)] }
  end
end

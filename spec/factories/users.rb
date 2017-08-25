FactoryGirl.define do
  factory :user do
    first_name {Faker::DrWho.quote}
    last_name {Faker::DrWho.specie }
    email {Faker::Internet.email}
  end
end

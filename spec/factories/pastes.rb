FactoryGirl.define do
  factory :paste do
    body { Faker::Lorem.sentence }
    user
  end
end
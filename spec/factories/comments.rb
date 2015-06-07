FactoryGirl.define do
  factory :comment do
    paste
    body { Faker::Lorem.sentence }
    user
  end
end
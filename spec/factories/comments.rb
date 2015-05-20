FactoryGirl.define do
  factory :comment do
    paste
    body "12345"
    user
  end
end
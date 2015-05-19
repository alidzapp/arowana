FactoryGirl.define do
  factory :comment do
    paste
    body "123"
    user
  end
end
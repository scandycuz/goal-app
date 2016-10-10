FactoryGirl.define do
  factory :user do
    username { Faker::Name.first_name }
    password { Faker::Internet.password(6) }
  end
end

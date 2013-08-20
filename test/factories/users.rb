FactoryGirl.define do
  factory :user do
    sequence(:nickname){|n| "xinzai#{n}" }
    sequence(:email) {|n| "xinzai#{n}@easyread.ly" }
    password '12345'
    password_confirmation '12345'
    avatar_url 'xxx.png'
  end
end

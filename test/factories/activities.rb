FactoryGirl.define do
  factory :activity do
    title 'awsome title'
    description 'awsome description'
    author_id 1
    start_at 1.days.since
    status 1
  end
end

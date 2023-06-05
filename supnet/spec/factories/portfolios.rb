FactoryBot.define do
  factory :portfolio do
    sequence(:id) { |n| n }
    status { "Active" }
    created { Time.now }
    name { "Test portfolio" }
    description { "portfolio desc" }
  end
end

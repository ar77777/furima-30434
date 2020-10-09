FactoryBot.define do
  factory :item do
    name              { 'test' }
    description       { 'test' }
    category_id       { 2 }
    condition_id      { 2 }
    buyer_burden_id   { 2 }
    prefecture_id     { 2 }
    delivery_time_id  { 2 }
    price             { 1000 }
    image { Faker::Lorem.sentence }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

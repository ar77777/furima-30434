FactoryBot.define do
  factory :item do
    name
    description
    category_id
    condition_id
    buyer_burden_id
    prefecture_id
    delivery_time_id
    image
  end
end

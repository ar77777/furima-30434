FactoryBot.define do
  factory :purchase_address do
      postal         { '111-1111' }
      prefecture_id  { '2' }
      city           { '福岡市' }
      block          { '福岡1-1-1' }
      phone_number   { '00000000000' }
      token          { 'tok_abcdefghijk00000000000000000' }
      association :user
      association :item
  end
end
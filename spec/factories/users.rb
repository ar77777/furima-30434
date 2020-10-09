FactoryBot.define do
  factory :user do
    nickname              {'山田'}
    first_name            {'太郎'}
    last_name             {'山田'}
    first_name_kana       {'タロウ'}
    last_name_kana        {'ヤマダ'}
    birthday              {Faker::Date.birthday}
    email                 {Faker::Internet.free_email}
    password              {'11111q'}
    password_confirmation {password}
  end
end

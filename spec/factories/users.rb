FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    family_name { '名字' }
    family_name_kana { 'ミョウジ' }
    first_name { '名前' }
    first_name_kana { 'ナマエ' }
    birth { '1980-1-1' }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end

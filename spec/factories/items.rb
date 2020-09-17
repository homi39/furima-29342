FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    category_id { 1 }
    status_id { 1 }
    shipping_cost_id { 1 }
    shipping_area_id { 1 }
    scheduled_shipping_date_id { 1 }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

FactoryBot.define do
  factory :order_location do
    token { 'a8ej7kw4rg' }
    postal_code { '123-4567' }
    shipping_area_id { 1 }
    city { '楽市' }
    block { '楽座' }
    phone_number { '09012345678' }
    
  end
end

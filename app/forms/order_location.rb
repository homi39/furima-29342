class OrderLocation

  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :block, :building, :phone_number, :token, :price, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_area_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 0 , message: 'Prefecture must be  be other than 0' }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    DeliveryLocation.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
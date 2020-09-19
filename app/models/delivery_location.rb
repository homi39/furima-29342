class DeliveryLocation < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :city
    validates :block
    validates :phone_number, format: { with: ^0\d{9,10}$ }
  end
  validates :predecture_id, numericality: { other_than: 0 }
end

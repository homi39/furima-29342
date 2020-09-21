class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one :delivery_location, through: :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :scheduled_shipping_date

  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :status
    validates :shipping_cost
    validates :shipping_area
    validates :scheduled_shipping_date
    validates :price, inclusion: { in: 300..9_999_999, message: 'is invalid. Input half-width characters within 300-9,999,999' }
    validates :image
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :scheduled_shipping_date_id
  end
end

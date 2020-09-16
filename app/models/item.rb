class Item < ApplicationRecord
  belongs_to :user
  has_one :order
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
   validates :price, inclusion: {in: (300..9999999)}
  end
  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :shipping_cost_id, numericality: { other_than: 0 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :scheduled_shipping_date_id, numericality: { other_than: 0 }
end

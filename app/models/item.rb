class Item < ApplicationRecord
  belongs_to :uesr
  has_one :order
end

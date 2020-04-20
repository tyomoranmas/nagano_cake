class Product < ApplicationRecord
  attachment :image
  enum is_stopped: { 販売中: false, 売切れ: true }

	has_many :cart_items
	has_many :order_products

  belongs_to :genre
end

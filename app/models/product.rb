class Product < ApplicationRecord
  attachment :image

	has_many :cart_items
	has_many :order_products

  belongs_to :genre

  enum is_stopped: { 販売中: false, 売切れ: true }

  validates :name, presence: true
  validates :tax_excluded_price, presence: true
end

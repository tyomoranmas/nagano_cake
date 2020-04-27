class Product < ApplicationRecord
  attachment :image

	has_many :cart_items
	has_many :order_products

  belongs_to :genre

  enum is_stopped: { 販売中: false, 売切れ: true }

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true
  validates :tax_excluded_price, format: { with: /\A[0-9０-９]+\z/ }
end

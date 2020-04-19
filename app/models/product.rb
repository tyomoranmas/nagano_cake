class Product < ApplicationRecord
	attachment :image
	belongs_to :genre
	has_many :order_products
end

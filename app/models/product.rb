class Product < ApplicationRecord
	attachment :image
	belongs_to :genre
	def self.search(search)
		
	end
end

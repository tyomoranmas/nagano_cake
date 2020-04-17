class EndUsers::CartItemsController < ApplicationController
	def index
		
	end
	def update
		
	end
	def destroy
		cart_item = Cart_item.destroy
	end
	def destroy_all
		cart_items = Cart_item.destroy_all
	end
	def create
		
	end
end

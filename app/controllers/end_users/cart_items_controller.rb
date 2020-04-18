class EndUsers::CartItemsController < ApplicationController
	def index
		cart_items == current_user
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
		@cart_item = current_cart
		@products = Product.find(params[:id])
		cart_item.save
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity)
	end
end 

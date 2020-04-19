class EndUsers::CartItemsController < ApplicationController
	def index
		@cart_items == current_end_user
		@cart_items = CartItem.all
		@cart_item = CartItem.new
	end
	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to end_users_cart_items

	end
	def destroy
		cart_item = Cartitem.destroy
	end
	def destroy_all
		cart_items = Cartitem.destroy_all
	end
	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		@cart_item.save
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity,:product_id,:end_user_id)
	end
end 

class EndUsers::CartItemsController < ApplicationController
	before_action :authenticate_end_user!

	def index
			@end_user  = current_end_user
			@cart_items = @end_user.cart_items
			@cart_item = CartItem.new
	end

	def show
			@end_user  = current_end_user
			@cart_items = @end_user.cart_items
			@cart_item = CartItem.new
	end

	def update
			@cart_item = CartItem.find(params[:id])
			@cart_item.update(cart_item_params)
			redirect_to end_users_cart_items_path
	end

	def destroy
			@cart_item = CartItem.find(params[:id])
			@cart_item.destroy
			@cart_item_id = @cart_item.id
			@end_user  = current_end_user
			@cart_items = @end_user.cart_items
			flash[:success] = "商品を削除しました"
			redirect_to end_users_cart_items_path
	end

	def destroy_all
		@end_user  = current_end_user
		@cart_items = @end_user.cart_items
		@cart_items.destroy_all
		flash[:success] = "カートを空にしました"
		redirect_to end_users_cart_items_path
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		@cart_item.save
		flash[:success] = "カートに追加しました"
		redirect_to end_users_cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity,:product_id,:end_user_id)
	end
end

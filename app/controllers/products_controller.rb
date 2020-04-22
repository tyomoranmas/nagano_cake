class ProductsController < ApplicationController
	def top
		@products = Product.all.limit(4)
		@genres = Genre.all
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:quantity,:product_id,:end_user_id)
	end
end

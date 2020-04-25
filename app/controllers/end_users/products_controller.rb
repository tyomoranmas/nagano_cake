class EndUsers::ProductsController < ApplicationController
	def top
		@products = Product.all.limit(4)
		@genres = Genre.all
	end
	def index
		# ↓一覧件数が全件取得できない
		@products = Product.all.page(params[:page]).reverse_order.per(8)
		@products2 = Product.all
		@genres = Genre.all
	end
	def show
		@cart_item = CartItem.new
		@product = Product.find(params[:id])
		@genres = Genre.all
		
	end
	private
	def product_params
		params.require(:product).permit(:name,:introduction,:image,:tax_excluded_price)
	end

end

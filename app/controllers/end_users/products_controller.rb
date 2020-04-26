class EndUsers::ProductsController < ApplicationController
	def top
		@genres = Genre.all
		@genres2 = Genre.joins(:products).where(is_disabled: "有効")
		@genres2.each do |genre|
			@products = genre.products.limit(4)
		end
	end
	def index
		# ↓一覧件数が全件取得できない
		@genres = Genre.all
		@genres2 = Genre.joins(:products).where(is_disabled: "有効")
		@genres2.each do |genre|
			@products = genre.products
		end
		@products = @products.all.page(params[:page]).reverse_order.per(8)

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

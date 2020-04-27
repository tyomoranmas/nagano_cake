class EndUsers::ProductsController < ApplicationController
	def top
		@genres = Genre.all
		@products = Product.joins(:genre).where(["genres.is_disabled = ?", 0]).page(params[:page]).reverse_order.per(8)
		@products = @products.all.limit(4)
	end

	def index
		# ↓一覧件数が全件取得できない
		@genres = Genre.all
		@products = Product.joins(:genre).where(["genres.is_disabled = ?", 0]).page(params[:page]).reverse_order.per(8)
		@products_count = Product.joins(:genre).where(["genres.is_disabled = ?", 0]).count
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

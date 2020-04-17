class EndUsers::ProductsController < ApplicationController
	def top
		@products = Product.select('id').limit(4)
		@genre = Genre.all
	end
	def index
		@products = Product.page(params[:page]).reverse_order
	end
	def show
		@products = Product.find(params[:id])
	end
	private
	def product_params
		params.require(:product).permit(:name,:introduction,:image,:tax_excluded_price)
	end
end

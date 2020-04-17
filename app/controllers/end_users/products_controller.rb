class EndUsers::ProductsController < ApplicationController
	def top
		@products = Product.all
		@genre = Genre.all
	end
	def index
		@products = Product.all
	end
	def show
		@products = Product.find(params[:id])
	end
	private
	def product_params
		params.require(:product).permit(:name,:introduction,:image,:tax_excluded_price)
	end
end

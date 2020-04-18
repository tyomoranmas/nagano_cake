class EndUsers::ProductsController < ApplicationController
	def top
		@products = Product.select('id').limit(4)
		@genres = Genre.all
	end
	def index
		if
			@products = Product.page(params[:page]).reverse_order
		elsif 
			@products = @genre.product.page(params[:page]).reverse_order
		end
		@genres = Genre.all
	end
	def show
		@products = Product.find(params[:id])
	end
	private
	def product_params
		params.require(:product).permit(:name,:introduction,:image,:tax_excluded_price)
	end
end

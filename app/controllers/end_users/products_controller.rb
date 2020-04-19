class EndUsers::ProductsController < ApplicationController
	def top
		@products = Product.all.limit(4)
		@genres = Genre.all
	end
	def index
		@products = Product.page(params[:page]).reverse_order
		@products2 = Product.all
		@genre = Genre.find(params[:id])
		@products = @genre.products.page(params[:page]).reverse_order
		@genres = Genre.all
	end
	def show
		@product = Product.find(params[:id])
		
		@genres = Genre.all
		
	end
	private
	def product_params
		params.require(:product).permit(:name,:introduction,:image,:tax_excluded_price)
	end
end

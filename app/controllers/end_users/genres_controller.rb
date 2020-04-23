class EndUsers::GenresController < ApplicationController
  def show
  		@genre = Genre.find(params[:id])
			@products = @genre.products.page(params[:page]).reverse_order
			@products2 = @genre.products.all
  		@genres = Genre.all
  end
end

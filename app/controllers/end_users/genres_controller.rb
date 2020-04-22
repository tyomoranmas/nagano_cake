class EndUsers::GenresController < ApplicationController
  def show
  		@genres = Genre.all
  		@genre = Genre.find(params[:id])
			@products = @genre.products.page(params[:page]).reverse_order
  end
end

class EndUsers::GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	if @genre.is_disabled == "無効"
  		redirect_to root_path
  	end
		@products = @genre.products.page(params[:page]).reverse_order
		@products2 = @genre.products.all
  	@genres = Genre.all
  end

  private
end

class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!

	def new
    @product = Product.new
    @genres = Genre.all
  end

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(product.id)
    else
      @product = Product.new
      @genres = Genre.all
      flash[:notice] = "商品名と価格は必ず入力してください"
      render :new
    end
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to admins_product_path(product)
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admins_products_path
    else
      render :show
    end
  end


	private
  def product_params
    params.require(:product).permit(:image, :name, :introduction, :genre_id, :tax_excluded_price, :is_stopped)
  end
end

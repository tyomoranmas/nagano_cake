class EndUsers::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_current_end_user

  def new
    if @end_user.cart_items.empty?
      redirect_to end_users_cart_items_path
    else
      @ship_addresses = @end_user.ship_addresses
      @order = Order.new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = @end_user.cart_items
    case params[:add]
    when "1"
      @order.post_code = @end_user.post_code
      @order.address = @end_user.address
      @order.address_name = @end_user.last_name + @end_user.first_name
    when "2"
      @ship_address = ShipAddress.find(params[:order][:end_user_id])
      @order.post_code = @ship_address.post_code
      @order.address = @ship_address.address
      @order.address_name = @ship_address.address_name
    when "3"
      @ship_address = ShipAddress.new(
        end_user_id: @end_user.id,
        post_code: @order.post_code,
        address: @order.address,
        address_name: @order.address_name)
      @ship_address.save
    end
  end

  def create
    @cart_items = @end_user.cart_items
    @order = Order.new(order_params)
    @order.end_user_id = @end_user.id
    if @order.save
      @cart_items.each do |item|
        @order_product = OrderProduct.new(
          product_id: item.product.id,
          order_id: @order.id,
          quantity: item.quantity,
          tax_included_price: (item.product.tax_excluded_price * 1.1))
        @order_product.save
        item.destroy
      end
      redirect_to end_users_finish_order_path(@order)
    else
      flash.now[:danger] = "入力情報に間違いがあります"
      render :new
    end
  end

  def index
    @orders = @end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    unless @order.end_user == @end_user
      redirect_to end_users_orders_path
    end
    @order_products = @order.order_products
  end


  def finish
  end

  private
    def order_params
      params.require(:order).permit(:id, :end_user_id, :post_code, :address_name, :address, :total, :payment, :status)
    end
end

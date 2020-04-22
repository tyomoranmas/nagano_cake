class EndUsers::OrdersController < ApplicationController
  before_action :set_current_end_user

  def new
    @ship_addresses = @end_user.ship_addresses
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = @end_user.cart_items
    if params[:add] == "1"
      @order.post_code = @end_user.orders.post_code
      @order.address = @end_user.orders.address
      @order.address_name = @end_user.orders.address_name
    elsif params[:add] == "2"
      @ship_address = ShipAddress.find(params[:ship_address][:ship_address.id])
      @order.post_code = @ship_address.post_code
      @order.address = @ship_address.address
      @order.address_name = @ship_address.address_name
    elsif params[:add] == "3"
      @order.end_user_id = @end_user.id
      @order.save
    else
      render :confirm
    end
  end

  def create
    @cart_items = @end_user.cart_items
    @order = Order.new(order_params)
    @order.end_user_id = @end_user.id
      flash[:success] = "注文情報が登録できました"
      redirect_to end_users_confirm_order_path(@order)
    end

  def index
    @orders = @end_user.orders
    # @order_products = @orders.order_products
  end

  def show
  end


  def finish
  end

  private
    def order_params
      params.require(:order).permit(:id, :end_user_id, :post_code, :address_name, :address, :total, :payment, :status)
    end
end

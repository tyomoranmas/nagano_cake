class EndUsers::OrdersController < ApplicationController
  before_action :set_current_end_user

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.end_user_id = @end_user.id
    if @order.save
      flash[:success] = "注文情報が登録できました"
      redirect_to end_users_confirm_order_path(@order)
    end
  end

  def index
    @orders = @end_user.orders
    # @order_products = @orders.order_products
  end

  def show
  end

  def confirm
  end

  def finish
  end

  private
    def order_params
      params.require(:order).permit(:post_code, :address_name, :address, :address, :total, :payment, :status)
    end
end

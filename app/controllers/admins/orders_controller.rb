class Admins::OrdersController < ApplicationController
  before_action :set_current_end_user
 def index
  @orders  = Order.all.order(created_at: :asc)
  @orders  = Order.page(params[:page]).per(10)
 end

 def show
  @order = Order.find(params[:id])
  @order_products = @order.order_products
  @order_product = OrderProduct.find(params[:id])
 end

 def update
  order = Order.find(params[:id])
  order.update(order_params)
  redirect_to admins_order_path(order)
 end

 private

 def order_params
  params.require(:order).permit(:status, order_products_attributes: [:production_status, :_destroy, :id])
 end
end

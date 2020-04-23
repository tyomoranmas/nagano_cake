class Admins::OrdersController < ApplicationController
 def index
  @orders  = Order.all.order(created_at: :asc)
  @orders  = Order.page(params[:page]).per(10)
  @cart_items = CartItem.all.all.order(created_at: :asc)
  @cart_items = CartItem.page(params[:page]).per(10)
 end

 def show
  @order = Order.find_by(params[:id])
  if @order
  else
   redirect_to admins_orders_path
   flash[:notice] = "本日の注文は、有りません"
  end
 end

 def update
  order = Order.find(params[:id])
  order.update(order_params)
  redirect_to admins_order_path(@end_user)
 end

 private
 def order_params
  params.require(:order).permit(:status, :created_at, :address_name)
 end
 def cart_item_params
  params.require(:order).permit(:quantity)
 end
end

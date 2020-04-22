class Admins::OrdersController < ApplicationController
   def index
    @orders = Order.all
   end

   def show
    @order = Order.find(params[:id])

   end

   def update
      order = Order.find(params[:id])
      order.update(order_params)
      redirect_to admins_order_path(end_user.id)
   end

   private
   def end_user_params
   params.require(:end_user).permit(:name, :emaail)
   end
end

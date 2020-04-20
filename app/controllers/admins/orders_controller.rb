class Admins::OrdersController < ApplicationController
   def index
   @orders = Order.all
   @orders = Order.paginate(page: params[:page])
   end

   def show

   end

   def update
      redirect_to admins_order_path(end_user.id)
   end

   private
   def end_user_params
   params.require(:end_user).permit(:name, :emaail)
   end
end

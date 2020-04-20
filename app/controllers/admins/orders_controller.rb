class Admins::OrdersController < ApplicationController
 def index
 	@orders = Order.all
    @orders = Order.paginate(page: params[:page])
 end

 def show

 end

 def update

 end
end

class OrdersController < ApplicationController
	def index
  	@end_users = EndUser.all
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

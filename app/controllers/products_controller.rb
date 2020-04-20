class ProductsController < ApplicationController
	def index
		@end_users = EndUser.all
	end

	private


	# 投稿データの受け取り
  	def end_user_params
  	params.require(:end_user).permit(:name, :email)
   	end
end

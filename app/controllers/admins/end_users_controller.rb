class Admins::EndUsersController < ApplicationController
 def index
  @end_users = EndUser.all
 end

 def show
 @end_user = EndUser.find(params[:id])

 end

 def edit
  @end_user = EndUser.find(params[:id])
 end

 def update
 end_user = EndUser.find(params[:id])
 end_user.update(end_user_params)
 edirect_to edit_admins_end_user_path(end_user.id)

 end
  private
   def admin_params
    params.require(:admin).permit(:id, :last_name, :first_name, :first_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :eis_deleted)
   end
end

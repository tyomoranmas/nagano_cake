class Admins::EndUsersController < ApplicationController
 def index
  	@end_users = EndUser.all
    #@end_users = Enduser.paginate(page: params[:page])
 end

 def show

 end

 def edit

 end

 def update
 	redirect_to edit_admins_end_user_path(end_user.id)

 end
  private
    def admin_params
      params.require(:admin).permit(:id, :email, :encrypted_password)
    end
end

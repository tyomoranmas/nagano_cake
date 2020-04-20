class Admins::EndUsersController < ApplicationController
 def index
  	@end_users = EndUser.all
    @end_users = Enduser.paginate(page: params[:page])
 end

 def show

 end

 def edit

 end

 def update
 	redirect_to edit_admins_end_user_path(end_user.id)

 end
  private
    def end_user_params
      params.require(:end_user).permit()
    end
end

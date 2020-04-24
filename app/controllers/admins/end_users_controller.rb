class Admins::EndUsersController < ApplicationController
   def index
      @end_users = EndUser.all.order(created_at: :asc)
      @end_users = EndUser.page(params[:page]).per(10)
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
      redirect_to admins_end_user_path(end_user.id)
   end

   private
      def end_user_params
         params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email, :is_deleted)
      end
end

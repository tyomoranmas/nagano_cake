class EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_current_end_user
  def show
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user), success: "会員情報の更新ができました。"
    else
      render :edit
    end
  end

  def leave
  end

  def delete
    @end_user.update(is_deleted: true)
    sign_out current_end_user
    redirect_to root_path, notice: "ありがとうございました。またのご利用を心よりお待ちしております。"
  end

  private
    def end_user_params
      params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
              :email, :post_code, :address, :phone_number, :is_deleted)
    end
end

class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  private
    def after_sign_in_path_for(resource)
      root_path(resource)
    end

    def after_sign_out_path_for(resource)
      new_end_user_session_path
    end

    def set_current_end_user
      @end_user = current_end_user
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana,
                                :email, :post_code, :address, :phone_number])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana])
    end
end

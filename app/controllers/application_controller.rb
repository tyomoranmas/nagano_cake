class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  private
    def after_sign_in_path_for(resource)
      case resource
      when Admin
        top_admin_path(resource)
      when EndUser
        if resource.is_deleted == "退会済み"
          sign_out resource
          flash[:notice] = "退会済みのユーザーです"
          root_path
        else
          root_path(resource)
        end
      end
    end

    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      else
        root_path
      end
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

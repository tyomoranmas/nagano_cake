class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method :current_cart
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

	

	def current_cart
		if session[:cart_itemes_id]
			@cart_item = Cart.find(session[:cart_items_id])
		else
			@cart_item = CartItem.create
			session[:car_items_id] = @cart_item.id
		end
	end
end


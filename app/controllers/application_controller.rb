class ApplicationController < ActionController::Base
  helper_method :set_user
  before_action :configure_permitted_parameters, :set_user, if: :devise_controller?

  def set_user
    @user = current_user
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    end
end

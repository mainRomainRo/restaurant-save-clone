class ApplicationController < ActionController::Base
  include ItemsHelper
  include PagesHelper

  helper_method :set_user
  before_action :configure_permitted_parameters, :set_user, if: :devise_controller?

  def set_user
    @user = current_user
  end

  def set_item
      @item = Item.find(params[:id])
  end

  private

  def require_admin
    unless current_user.role == "admin"
      flash[:error] =  "Vous n'avez pas les droits Admin."
      redirect_to root_path # halts request cycle
    end
  end

  protected


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    end
end

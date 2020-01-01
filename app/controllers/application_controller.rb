class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permited_params, if: :devise_controller?

  protected

  def configure_permited_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :image])
  end
end

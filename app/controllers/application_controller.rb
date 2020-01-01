class ApplicationController < ActionController::Base
  before_action :configure_permited_params, if: :devise_controller?

  before_action :store_current_location, :unless => :devise_controller?

  protected

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "devise"
    else
      "application"
    end
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permited_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :image])
  end

end

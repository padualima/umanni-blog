class ApplicationController < ActionController::Base
  before_action :configure_permited_params, if: :devise_controller?

  protected

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "devise"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    dashboard_homes_index_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permited_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :image])
  end
end

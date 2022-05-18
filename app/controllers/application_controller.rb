# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end

  def after_sign_in_path_for(resource)
    personals_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def user_auth
    current_user.personals.where(project_id:@project.id).pluck('role')[0] == 'owner'
  end

  protected

  def layout_by_resource
    if devise_controller?
      'home'
    else
      'application'
    end
  end
    
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

end

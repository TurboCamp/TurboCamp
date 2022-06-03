# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  include Pundit
  def not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end

  def owner?
    current_user.personals.where(project_id: @project.id).pluck('role')[0] == 'owner'
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      'application'
    end
  end
end

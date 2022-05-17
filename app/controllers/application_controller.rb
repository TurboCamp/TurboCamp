class ApplicationController < ActionController::Base
  layout :layout_by_resource
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  include Pundit::Authorization

  def not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end

  def after_sign_in_path_for(_resource)
    personals_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  protected

  def layout_by_resource
    if devise_controller?
      'home'
    else
      'application'
    end
  end
end

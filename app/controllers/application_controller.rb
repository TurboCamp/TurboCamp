# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end
  
  def owner?
    current_user.personals.where(project_id:@project.id).pluck('role')[0] == 'owner'
  end

  private

  def layout_by_resource
    if devise_controller?
      'home'
    else
      'application'
    end
  end
end

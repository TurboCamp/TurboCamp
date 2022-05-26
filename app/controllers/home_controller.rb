# frozen_string_literal: true

class HomeController < ApplicationController
  layout 'home'
  def index
    redirect_to personal_path if user_signed_in?
  end
end

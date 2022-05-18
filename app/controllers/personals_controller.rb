# frozen_string_literal: true

class PersonalsController < ApplicationController
  before_action :authenticate_user!
  before_action :findmyproject, only: %i[show edit update destroy]
  layout 'personals'

  def index
    if user_signed_in?
      @projects = current_user.projects.all
    else
      redirect_to new_user_session_path, notice: '請登入！'
    end
  end
end

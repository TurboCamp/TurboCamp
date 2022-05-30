# frozen_string_literal: true

class PersonalsController < ApplicationController
  before_action :authenticate_user!
  layout 'personals'

  def show
    @user = current_user
    @projects = @user.projects
  end
end

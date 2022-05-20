# frozen_string_literal: true

class PersonalsController < ApplicationController
  before_action :authenticate_user!
  def show
      @projects = current_user.projects
  end
end

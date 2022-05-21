# frozen_string_literal: true

class PersonalsController < ApplicationController
  before_action :authenticate_user!
  layout 'personals'
  def show
      @projects = current_user.projects
  end
end

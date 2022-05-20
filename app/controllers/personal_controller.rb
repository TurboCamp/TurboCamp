# frozen_string_literal: true

class PersonalController < ApplicationController
  before_action :authenticate_user!
  before_action :findmyproject, only: %i[show edit update destroy]
  def index
      @projects = current_user.projects
  end
end

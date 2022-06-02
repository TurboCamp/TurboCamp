# frozen_string_literal: true

class BucketsController < ApplicationController
  before_action :current_project, only: %i[show]
  before_action :authenticate_user!

  def show
    @bucket = @project.bucket
    @documents = @bucket.documents
    @document = Document.new
  end

  private

  def current_project
    @project = current_user.projects.friendly.find(params[:project_id])
  end
end

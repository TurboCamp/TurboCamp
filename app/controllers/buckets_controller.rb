# frozen_string_literal: true

class BucketsController < ApplicationController
  before_action :current_project, only: %i[index new create ]
  # before_action :create_new_docs, only: %i[document upload]
  before_action :authenticate_user!
  def index 
    @buckets = @project.buckets
  end 

  def new 
    @bucket = @project.buckets.new 
  end 

  def create 
    @bucket = @project.buckets.new(bucket_params)
    if @bucket.save 
      redirect_to project_buckets_path(@project) , notice:'成功新增'
    else
      render :new 
    end
  end

  private 

  def bucket_params
    params.require(:bucket).permit(:title , :status)
  end

  def current_project 
    @project = current_user.projects.friendly.find(params[:project_id])
  end
end
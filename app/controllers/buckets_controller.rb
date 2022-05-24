# frozen_string_literal: true

class BucketsController < ApplicationController
  before_action :current_project, only: %i[show ]
  before_action :authenticate_user!
  
  def show 
    @bucket = @project.bucket
  end

  def document 
    @bucket = @project.bucket.new(bucket_params)
    if @bucket.save 
      redirect_to project_bucket_path(@project) , notice:'上傳檔案成功'
    else
      render :show , alert:'上傳失敗'
    end
  end

  private 

  def bucket_params
    params.require(:bucket).permit(:title , :status ,:document)
  end

  def current_project 
    @project = current_user.projects.friendly.find(params[:project_id])
  end
end
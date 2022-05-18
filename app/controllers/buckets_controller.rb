# frozen_string_literal: true

class BucketsController < ApplicationController
  before_action :find_bucket, only: %i[show edit update destroy]
  before_action :create_new_docs, only: %i[document upload]
  before_action :authenticate_user!
  def index
    @buckets = current_project.buckets.all
  end

  def document; end

  def upload; end

  def create
    @bucket = current_project.buckets.new(bucket_params)
    if @bucket.save
      redirect_to buckets_path(params[:id])
    else
      render :upload
    end
  end

  def edit; end

  def update
    if @bucket.update(bucket_params)
      redirect_to buckets_path, notice: '成功更新'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @bucket.destroy
    redirect_to buckets_path, notice: '成功刪除'
  end

  private

  def find_bucket
    @bucket = current_project.buckets.find(params[:id])
  end

  def bucket_params
    params.require(:bucket).permit(:title, :attach, :content, :status)
  end

  def create_new_docs
    @bucket = Bucket.new
  end
end

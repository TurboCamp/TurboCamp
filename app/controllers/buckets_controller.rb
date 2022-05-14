class BucketsController < ApplicationController
  before_action :find_bucket, only: [:show, :edit, :update, :destroy]
  before_action :create_new_docs, only: [:document, :upload]
  def index
    @buckets = Bucket.all
  end

  def new
  end

  def document
  end

  def upload
  end

  def create
    @bucket = Bucket.new(bucket_params)
    if @bucket.save
      redirect_to buckets_path(params[:id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to buckets_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @bucket.destroy
    redirect_to buckets_path 
  end


  private
  def find_bucket
    @bucket = Bucket.find(params[:id])
  end
  def bucket_params
    params.require(:bucket).permit(:title, :attach, :content)
  end
  def create_new_docs
    @bucket = Bucket.new
  end
end
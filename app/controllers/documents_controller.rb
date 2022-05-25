class DocumentsController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_bucket 
  def  create
    @project = current_user.projects.friendly.find(params[:project_id])
    @bucket = @project.bucket 
    @document = @bucket.documents.create(document_params)
  end

  def destroy 
    @document = @bucket.documents.find(params[:id])
    @document.destroy if @document
  end

  private

  def set_bucket
    @project = current_user.projects.friendly.find(params[:project_id])
    @bucket = @project.bucket 
  end
 
  def document_params
    params.require(:document).permit(:document)
  end
end
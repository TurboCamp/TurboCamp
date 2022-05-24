class DocumentsController < ApplicationController 
  before_action :authenticate_user!
  def  create
    @project = current_user.projects.friendly.find(params[:project_id])
    @bucket = @project.bucket 
    @document = @bucket.documents.create(document_params)
  end

  private
 
  def document_params
    params.require(:document).permit(:document)
  end
end
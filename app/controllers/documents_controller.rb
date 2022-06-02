# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bucket
  def  create
    @document = @bucket.documents.create(document_params)
    @document.document_derivatives! if @document.document.mime_type.include? 'image'
  end

  def destroy
    @document = @bucket.documents.find(params[:id])
    @document.update(document_data: nil)
    @document&.destroy
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

# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :find_project, only: %i[index new create destroy]
  before_action :find_location, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @messages = @project.messages
  end

  def show
    @comment = Comment.new 
    @comments = @message.comments
  end

  def new
    @message = Message.new
  end

  def create
    @message = @project.messages.new(message_params)
    if @message.save
      redirect_to project_messages_path, success: 'Message successfully created!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to project_message_path(@project, @message), notice: 'Message successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy if @message
    redirect_to project_messages_path(@project), alert: 'Message has been deleted!'
  end

  private

  def find_location
    @project = current_user.projects.friendly.find(params[:project_id])
    @message = @project.messages.friendly.find(params[:id])
  end

  def find_project
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def message_params
    params.require(:message).permit(:title, :content, :status, :image)
  end
end

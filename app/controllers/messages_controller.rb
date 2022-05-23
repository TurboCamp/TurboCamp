# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :find_project , only: %i[index new create] 
  before_action :find_location, only: %i[show edit update destroy ]
  before_action :authenticate_user!
  def index
    @messages = @project.messages
  end

  def show; end

  def new
    @message = Message.new
  end

  def create
    @message = @project.messages.new(message_params)
    if @message.save
      redirect_to project_messages_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to project_message_path(@project ,@message), notice: '成功更新'
    else
      render :edit
    end
  end

  def destroy
<<<<<<< HEAD
    @message.destroy if @message
    redirect_to project_messages_path(@project), notice: '成功刪除'
=======
    @message.destroy
    redirect_to messages_path, notice: '成功刪除'
>>>>>>> fix message index show and add message routes with shallo
  end

  private

  def find_location
    @project = current_user.projects.friendly.find(params[:project_id])
    @message = @project.messages.friendly.find(params[:id])
  end
  
  def find_project 
    @project = current_user.projects.friendly.find(params[:project_id])
  end
  
  def find_project 
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def message_params
    params.require(:message).permit(:title, :content, :status)
  end
end

# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :find_project , only: %i[index create destroy]
  before_action :find_message, only: %i[show edit update destroy]
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
      redirect_to message_path, notice: '成功更新'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy if @message
    redirect_to project_messages_path, notice: '成功刪除'
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end
  
  def find_project 
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def message_params
    params.require(:message).permit(:title, :content, :status)
  end
end

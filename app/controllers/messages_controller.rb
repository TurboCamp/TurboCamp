# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :find_message, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    @messages = Message.all
  end

  def show; end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to messages_path, notice: '成功更新'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy

    redirect_to messages_path, notice: '成功刪除'
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :content, :status)
  end

  def create_new_message
    @message = Message.new
  end
end

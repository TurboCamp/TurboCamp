class MessageBoardsController < ApplicationController
  def index
    @messages = Message.all
  end
end
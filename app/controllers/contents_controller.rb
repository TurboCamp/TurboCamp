# frozen_string_literal: true

class ContentsController < ApplicationController
  def create
    @content = Content.new(content_params)
    # render html:params
    ChatRoomChannel.broadcast_to(@content.chat_room, @content) if @content.save
  end

  private

  def content_params
    params.require(:content).permit(:text, :chat_room_id ,:user )
  end
end

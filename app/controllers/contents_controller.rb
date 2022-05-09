class ContentsController < ApplicationController 
    def create 
        @content = Content.new(content_params)

      if @content.save
        ChatRoomChannel.broadcast_to(@content.chat_room , @content)
      end
    end 

    private 
    
    def content_params
        params.require(:content).permit(:text , :chat_room_id)
    end
end
class ChatRoomsController < ApplicationController 
    layout'project'
    def create 
    end
    def show 
        @chat_room = ChatRoom.find(params[:id])
        @contents = @chat_room.contents
        @content = Content.new
    end


end
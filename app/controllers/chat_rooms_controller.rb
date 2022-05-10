class ChatRoomsController < ApplicationController 
    
    layout'project'
    before_action :authenticate_user!
    
    def show

        if user_signed_in?
           
                @chat_room = ChatRoom.find(params[:id])
                @contents = @chat_room.contents
                @content = Content.new
        else
            redirect_to root_path , notice:'請登入'
        end
    end
end
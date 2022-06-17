require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  describe '群組聊天' do 
    let(:project) { Project.create!( title:"test" , description: "test description")}
    
    it '群組聊天室屬於專案' do 
      @chat_room = project.chat_room.build
      @chat_room.save
      expect(@chat_room.project_id).to_not be nil
    end

  end
end


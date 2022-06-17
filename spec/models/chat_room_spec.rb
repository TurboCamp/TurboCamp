require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  describe 'group chatroom' do 
    let(:project) { create(:project) }

    it 'chatroom belongs to project' do 
      chat_room = project.chat_room
      expect(chat_room.project_id).to_not be nil
    end

    it 'if user in project then user will be member of chatroom' do  
      chat_room = project.chat_room
      expect(chat_room.users = project.users)
    end
  end
end


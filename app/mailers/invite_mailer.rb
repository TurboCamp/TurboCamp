class InviteMailer < ApplicationMailer
    def send_invite_letter_to(user )
        @user = user 
        @token = token
        mail to:[@user ,@token], subject:'TurboCamp 成員邀請'
    end

end

class InviteMailer < ApplicationMailer
    default from: ENV['MAILGUN_USERNAME']
    def send_invite_letter_to(invitation , project)
        @invitation = invitation
        @project = project
        mail(to: @invitation.email, subject: "邀請加入TurboCamp")
    end

end

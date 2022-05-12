class InvitationsController < ApplicationController 
    layout'project'

    def new
      @invitation = Invitation.new
    end
  
    def create
        @invitation = current_user.invitations.new(invitation_params)
      if @invitation.save 
        @project = Project.friendly.find(params[:project_id])
        @invitation.update(invite_project_id:params[:project_id])
        # render html:params[:project_id]
        # render html: @project.friendly_id
        # InviteMailer.send_invite_letter_to(@invitation , @project).deliver_now
        redirect_to personals_path , notice:"成功邀請 #{@invitation.email}"
      else
        @invitation = Invitation.new
        render :new , notice:'邀請失敗'
      end
    end
  
    private
  
    def invitation_params
      params.require(:invitation).permit( :email)
    end
  end
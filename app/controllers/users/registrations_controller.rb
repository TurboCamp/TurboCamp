# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  
  def new_user_with_letter # 使用 invitation token 註冊
    invitation = Invitation.where(token: params[:token]).first
    if invitation
      @invitation_token = invitation.token
      @user = User.new(email: invitation.email)
      # render html:invitation.token
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      rnder html:@user
      session[:user_id] = @user.id
      join_project(@user)
      redirect_to personals_path , notice:'你已成功登入'
    else
      render :new , notice:'註冊失敗'
    end
  end

  private

  def join_project(user)
    invitation = Invitation.where(token: params[:invitation_token]).first
    if invitation
      project = Project.friendly.find(params[:invite_project_id])
      user.projects.concat(project)
      Invitation.clear_token
    end
  end
  
end

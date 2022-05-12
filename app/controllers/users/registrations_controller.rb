# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # def new_user_with_letter

  #   invitation = Invitation.where(token: params[:token]).first
  #   if invitation
  #     @invitation_token = invitation.token
  #     @user = User.new(email: invitation.email)
  #     render :new
  #   else
  #     redirect_to root_path , notice:'此連結無效'
  #   end
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     session[:user_id] = @user.id
  #     join_project(@user)
  #     redirect_to personals_path, notice:'你已成功加入'
  #   else
  #     render :new , notice:'請重新點選網址登入'
  #   end
  # end

  # private 

  # def join_project(user)
  #   invitation = Invitation.where(token: params[:invitation_token]).first
  #   if invitation 
  #     project = Project.friendly.find(invitation.invite_project_id)
  #     # project.user.concat(user)
  #     # user.projects.concat(project)
  #     user.projects.create(project)
  #     clear_token
  #   end
  # end
  
end

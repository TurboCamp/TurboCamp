# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < Api::V1::BaseController
      def invite_member
        user = User.where(email: params[:email]).first
        message = '請重新邀請'
        unless user.nil?
          project = Project.friendly.find(params[:id])
          if project.users.exists?(user.id)
            message = '成員已存在'
          else
            project.users << user
            project.chat_room.users << user
            message = '成功邀請成員'
          end
        end
        render json: { message: }
      end
    end
  end
end

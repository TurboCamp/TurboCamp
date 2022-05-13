class Api::V1::ProjectsController < Api::V1::BaseController

    def search 
        user = User.where(email: params[:email])
        message = '請重新邀請'
        if user_signed_in?
            message = "成功邀請成員"
        end

        # render json: {message: message , data: users}
        render json: params

    end
end
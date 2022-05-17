class Users::InfosController < ApplicationController 
    def info 
        if user_signed_in?
            @user = current_user
        else 
            redirect_to new_user_session_path
        end
    end
    def setting
        if @user.update(update_user_info)
            redirect_to  users_info_path
        end 
    end
    private 

    def update_user_info
        params.require(:user).permit(:email , :imageurl , :nickname , :avatar , :slug)
    end
end
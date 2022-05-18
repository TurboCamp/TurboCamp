# frozen_string_literal: true

class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_my_project , only:[:show ,:edit , :update , :destroy ]

    def new 
        @project = Project.new
    end
    def create 
        @project = current_user.projects.create(project_clean)
        current_user.personals.where(project_id:@project.id).update(role:'owner')
        if @project.save 
            redirect_to project_path(@project) 
        else
            render :new 
        end
    end 

    def show 
        @chat_room = @project.chat_room
    end 
    def edit 
    end 
    def update 
        if user_auth
            if @project.update(project_clean)
                redirect_to project_path(@project) , notice:'專案更新成功'
            else 
                render :edit 
            end
        else
            redirect_to project_path(@project) , notice:'尚無權限'
        end
    end 

    def destroy
        if user_auth
            @project.destroy
            redirect_to personals_path , notice:'已刪除專案'
        else
            redirect_to project_path(@project) , notice:'尚無權限'
        end
    end 

 
    private 
    def project_clean 
        params.require(:project).permit(:title , :description , :nickname , :updated_at )
    end

    def find_my_project
        @project = current_user.projects.friendly.find(params[:id])
    end
end

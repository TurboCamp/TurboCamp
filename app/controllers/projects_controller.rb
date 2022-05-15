class ProjectsController < ApplicationController
    layout 'home'
    before_action :authenticate_user!
    def index 

    end 
    def new 
        @project = Project.new
    end
    def create 
        @project = Project.new(project_clean)
        @project.user_id = current_user.id
        @project.manage = "manager"
        if @project.save 
            redirect_to personals_path 
        else
            render :new 
        end
    end 
    def show 
    end 
    def edit 
    end 
    def update 
    end 
    def destroy
    end 

    private 
    def project_clean 
        params.require(:project).permit(:title , :description , :nickname , :update_at  )
    end
end

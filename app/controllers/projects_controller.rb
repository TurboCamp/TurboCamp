class ProjectsController < ApplicationController
    layout 'project'
    before_action :authenticate_user!
    before_action :find_my_project , only:[:show ]

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
        @chat_room = @project.chat_room
    end 
    def edit 
    end 
    def update 
    end 
    def destroy
    end 

    private 
    def project_clean 
        params.require(:project).permit(:title , :description , :nickname , :updated_at )
    end

    def find_my_project
        @project = Project.friendly.find(params[:id])
    end

   
    
end
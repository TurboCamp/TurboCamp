class ProjectsController < ApplicationController
    layout 'project'
    before_action :authenticate_user!
    before_action :find_my_project , only:[:show ]

    def new 
        @project = Project.new
    end

    def create 
        @project = current_user.projects.create(project_clean)
        
        # render html: params
        @project.update(manage:"manager")
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
    end 
    def destroy
    end 
    def invite
        @project = current_user.projects.friendly.find(params[:id])
        
    end
  
    private 

   
    def project_clean 
        params.require(:project).permit(:title , :description , :nickname , :updated_at , :manage, :useremail )
    end

    def find_my_project
        @project = current_user.projects.friendly.find(params[:id])
    end

end
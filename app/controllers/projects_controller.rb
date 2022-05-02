class ProjectsController < ApplicationController
    before_action :authenticate_user!
    before_action :findmyproject , only: %i[show edit update destroy]
    def index
        if user_signed_in?
            @projects = current_user.projects.find(params[:id])
        else 
            redirect_to new_user_session_path , notice:"請登入！"
        end
    end 
    def new 
        @project = Project.new
    end

    def create
        @project = current_user.projects.new(clean)
        if @project.save 
            redirect_to myproject_path , notice:"成功新增專案！"
        else
            render :new , alert:"請重新輸入！"
        end
    end
    def show
    end
    def edit
    end
    def update 
        if @project.update 
            redirect_to myproject_path , notice:"成功編輯專案！"
        else
            render :edit
        end
    end
    def destroy 
    end


    private 

    def clean 
        params.require(:project).permit(:nickname , :useremail , :member)
    end

    def findmyproject
        @project = current_user.project.find(params[:id])
    end
end
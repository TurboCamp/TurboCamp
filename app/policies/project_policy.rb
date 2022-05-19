# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
    attr_reader :user, :project

    def initialize(user, project)
      @user = user
      @project = project
    end
    def index?
        false
    end 
    def new? 
        create?
    end 
    def create? 
       owner || teammate
    end 
    def edit? 
        update?
    end
    def show?
         owner || teammate 
    end
    def update? 
        owner
    end
    def destroy? 
       owner
    end

    private 
    def owner
      user.personals.where(project_id:@project.id).pluck('role')[0] == 'owner'
    end
    
    def teammate 
      user.personals.where(project_id:@project.id).pluck('role')[0] == 'teammate'
    end
end

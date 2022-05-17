# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
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
end

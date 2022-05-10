# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
    def index?
        false
    end 
    def new? 

    end 
    def create? 
        # manager || teammate
    end 
    def edit? 

    end
    def show?
        # manager || teammate 

    end
    def update? 

    end
    def destroy? 
        manager
    end
end
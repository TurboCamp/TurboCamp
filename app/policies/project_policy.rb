# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
<<<<<<< HEAD
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
=======
  def index?
    false
  end

  def new?; end

  def create?
    # manager || teammate
  end

  def edit?; end

  def show?
    # manager || teammate
  end

  def update?; end

  def destroy?
    manager
  end
end
>>>>>>> run rubocop

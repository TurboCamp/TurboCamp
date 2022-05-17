# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end

<<<<<<< HEAD
  private 
  
  def owner
    user.personals.where(project_id:@project).pluck('role')[0] == 'owner'
  end

  def teammate 
    user.personals.where(project_id:@project).pluck('role')[0] == 'teammate'
=======
  private

  def manager
    user.projects.manage == 'manager' && user.role == 'user'
  end

  def teammate
    user.projects.manage == 'manager' && user.role == 'user'
>>>>>>> run rubocop
  end
end

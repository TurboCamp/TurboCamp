# frozen_string_literal: true

class ProjectsController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :find_my_project, only: %i[show edit update destroy]
  
  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_clean)
    current_user.personals.where(project_id: @project.id).update(role: 'owner')
    if @project.save
      @project.chat_room.users << current_user 
      redirect_to project_path(@project), success: 'Project successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    authorize @project, policy_class: ProjectPolicy
    if @project.update(project_clean)
      redirect_back fallback_location: root_path, notice: 'Project successfully updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @project, policy_class: ProjectPolicy
    @project.destroy
    redirect_to personal_path, alert: 'Project has been deleted!'
  end

  private

  def project_clean
    params.require(:project).permit(:title, :description, :nickname, :imageurl, :image)
  end

  def find_my_project
    @project = current_user.projects.friendly.find(params[:id])
  end
end

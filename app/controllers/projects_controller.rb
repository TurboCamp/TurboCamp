# frozen_string_literal: true

class ProjectsController < ApplicationController
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :find_my_project, only: %i[show edit update destroy]

  def new
    @project = Project.new
    render layout: 'personals'
  end

  def create
    @project = current_user.projects.create(project_clean)
    current_user.personals.where(project_id: @project.id).update(role: 'owner')
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show; end
  def edit; end

  def update
    authorize @project, policy_class: ProjectPolicy
    if @project.update(project_clean)
      redirect_to project_path(@project), notice: '專案更新成功'
    else
      render :edit
    end
  end

  def destroy
    authorize @project, policy_class: ProjectPolicy
    @project.destroy
    redirect_to personal_path, notice: '已刪除專案'
  end

  private

  def project_clean
    params.require(:project).permit(:title, :description, :nickname, :imageurl, :avatar)
  end

  def find_my_project
    @project = current_user.projects.friendly.find(params[:id])
  end
end

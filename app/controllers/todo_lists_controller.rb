# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[show edit update destroy]
  before_action :set_project
  before_action :authenticate_user!
  def index
    @todo_lists = @project.todo_lists
    
  end

  def show
    @todo_item = TodoItem.new
    @project = current_user.projects.friendly.find(params[:project_id])
    @todo_list = @project.todo_lists.find(params[:id])
    @todo_items = @todo_list.todo_items
  end

  def new
    @todo_list = TodoList.new
  end

  def edit; end

  def create
    @todo_list = @project.todo_list.new(todo_list_params)

    if @todo_list.save
      redirect_to [@project, @todo_list], notice: 'Todo list 建立成功'
    else
      render :new
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to todo_list_url(@todo_list), alert: 'Todo list 更新成功'
    else
      render :edit
    end
  end

  def destroy
    @todo_list.destroy

    redirect_to todo_lists_url
  end

  private

  def set_project
    @project = current_user.projects.friendly.find(params[:project_id])
    # @todo_list = @project.todo_lists.friendly.find(params[:id])
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, todo_items: [:todo_list], variants_attributes: [:_destroy])
  end
end

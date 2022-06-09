# frozen_string_literal: true

class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[show edit update destroy move]
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
    @todo_list = @project.todo_lists.new(todo_list_params)

    if @todo_list.save
      redirect_to project_todo_lists_path(@project), success: "Todo's group successfully created!"
    else
      render :new
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to project_todo_list_path(@project, @todo_list), notice: "Todo's group successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @todo_list.destroy
    redirect_to [@project, @todo_list], alert: "Todo's group has been deleted!"
  end

  def move
    todo_list = @project.todo_lists.find(params[:id])
    todo_list.update(position: params[:position].to_i)
    todo_list.update(status: params[:status])
    render json: { message: "ok"}
  end

  private

  def set_project
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :start, :position, :status , todo_items: [:todo_list])
  end

end

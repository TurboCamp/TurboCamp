# frozen_string_literal: true

class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_project, only: %i[create destroy]
  before_action :set_todo_item, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @todo_items = @todo_list.todo_items
  end

  def show; end

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def edit; end

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    if @todo_item.save
      redirect_to [@project, @todo_item.todo_list]
    else
      render :new
    end
  end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to([@todo_item.todo_list, @todo_item])
    else
      render :edit
    end
  end

  def destroy
    @todo_item.destroy
    redirect_to [@project, @todo_item.todo_list]
  end

  private

  def set_project
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:description, :completed, :completed_at, :todo_list_id)
  end
end

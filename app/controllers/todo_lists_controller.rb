class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[ show edit update destroy ]

  def index
    @todo_lists = TodoList.all
  end

  def show
    @todo_item = TodoItem.new
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)

      if @todo_list.save
        redirect_to todo_list_url(@todo_list), notice: "Todo list 建立成功" 
      else
        render :new
      end
  end

  def update
      if @todo_list.update(todo_list_params)
        redirect_to todo_list_url(@todo_list), notice: "Todo list 更新成功"
      else
        render :edit
      end
  end

  def destroy
    @todo_list.destroy

      redirect_to todo_lists_url, notice: "Todo list 已刪除"
  end

  private
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, todo_items: [:todo_list])
    end
end

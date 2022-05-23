# frozen_string_literal: true

class SchedulesController < ApplicationController

  before_action :set_schedule, only: %i[show edit update destroy]
  before_action :set_project
  before_action :authenticate_user!

  def index
    @schedules = @project.schedule
  end

  def show; end

  def new
    @schedule = Schedule.new
  end

  def edit; end

  def create
    @schedule = @project.build_schedule(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to [@project, @schedule], notice: '已新增' }
        format.json { render :show, status: :created, location: [@project, @schedule] }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: 503 }
      end
    end
  end

  def update

    respond_to do |format|

      if @schedule.update(schedule_params)
        format.html { redirect_to project_schedule_path [@project],notice: '已更新' }
        format.json { render :show, status: :ok, location: [@project] }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: 503 }
      end
    end
  end

  def destroy
    @schedule.destroy

    respond_to do |format|
      format.html {
        redirect_to [@project, @schedule],notice: '已刪除'
      }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = current_user.projects.friendly.find(params[:project_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :calendar_id, :start, :end, :location)
  end

end

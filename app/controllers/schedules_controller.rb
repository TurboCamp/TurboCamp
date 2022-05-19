# frozen_string_literal: true

class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]
  before_action :set_project, only: %i[create update destroy]
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @project = projects.friendly.find(params[:id])
      @schedule = Schedule.new
    else
      render :new
    end
  end

  def show; end

  def new
    @schedule = Schedule.new
  end

  def edit; end

  def create
    
    @schedule = @project.schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedule_url(@schedule), notice: '已新增' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: 404 }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.schedule.update(schedule_params)

        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: 404 }
      end
    end
  end

  def destroy
    @prohect.schedule.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.friendly.find(params[:project_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :calendar_id, :start, :end, :location)
  end
end

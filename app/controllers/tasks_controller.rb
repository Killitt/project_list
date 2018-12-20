class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, success: 'Task successfully created'
    else
      flash.now[:danger] = 'Task not created'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to @task, success: 'Task successfully updated'
    else
      flash.now[:danger] = 'Task not updated'
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, success: 'Task successfully deleted'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :project_id, :user_id)
  end
end
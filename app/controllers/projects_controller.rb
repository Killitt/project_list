class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.all
  end

  def show
    @tasks = Task.where(project_id: [@project])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      flash.now[:danger] = 'Project not created'
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, success: 'Project successfully updated'
    else
      flash.now[:danger] = 'Project not updated'
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, success: 'Project successfully deleted'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :summary, :start_date, :end_date)
  end
end
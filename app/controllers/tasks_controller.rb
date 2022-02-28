class TasksController < ApplicationController
  COLOR = ['warning', 'success', 'primary']

  def index
    @tasks = Task.order(:status).order(updated_at: :desc)
    @colors = COLOR
  end

  def show
  end

  def edit
  end

  def update
    Task.find(params[:id]).update(task_params)
    redirect_to tasks_path
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def new
    @task = Task.new
  end

  private

  def task_params
    params.require(:task).permit(:title, :status)
  end
end

class TasksController < ApplicationController
  before_action :set_task, only: %i[toggle destroy]
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html do
          redirect_to tasks_url, notice: "Task has successfully created"
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @task.update(completed: params[:completed])

    respond_to { |format| format.json { render json: { status: "ok" } } }
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end

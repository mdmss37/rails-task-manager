class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @done = convert_done(@task[:done])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    done = params[:done] == "1" ? true : false
    @task.update(task_params)
    @task[:done] = done
    @task.save
    redirect_to tasks_path
  end

  def destroy
    @restaurant = Task.find(params[:id])
    @restaurant.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :due)
  end

  def convert_done(bool)
    bool ? "Done" : "Not Done"
  end

end

class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks.to_json(only: [:name, :completed],
                                include: [ list: {only: [:name]}])
  end

  def show
    task = Task.find(params[:id])
    render json: task.to_json(only: [:name, :completed],
                                include: [ list: {only: [:name]}])
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task.to_json(only: [:name, :completed],
                                  include: [ list: {only: [:name]}])
    end
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      render json: task.to_json(only: [:name, :completed],
                                  include: [ list: {only: [:name]}])
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: Task.all.to_json(only: [:name, :completed],
                                include: [ list: {only: [:name]}])
  end
  private

  def task_params
    params.require(:task).permit(:name, :completed, :list_id)
  end

end

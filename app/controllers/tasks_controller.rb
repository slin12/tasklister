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
    body = JSON.parse(request.body.read)
    task = Task.create(body)
  end
end

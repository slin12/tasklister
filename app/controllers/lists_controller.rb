class ListsController < ApplicationController
  def index
    lists = List.all
    render json: lists.to_json(only: [:name],
                                include: [tasks: {only: [:name, :completed]}])
  end

  def show
    list = List.find(params[:id])
    render json: list.to_json(only: [:name],
                                include: [tasks: {only: [:name, :completed]}])
  end

  def create
    byebug
    render json: list.to_json(only: [:name],
                                include: [tasks: {only: [:name, :completed]}])
  end
end

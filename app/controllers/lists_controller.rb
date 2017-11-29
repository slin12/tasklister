class ListsController < ApplicationController
  def index
    lists = List.all
    render json: lists.to_json(only: [:name, :id],
                                include: [tasks: {only: [:name, :completed]}])
  end

  def show
    list = List.find(params[:id])
    render json: list.to_json(only: [:name, :id],
                                include: [tasks: {only: [:name, :completed]}])
  end

  def create
    list = List.new(list_params)
    if list.save
    render json: list.to_json(only: [:name],include: [tasks: {only: [:name, :completed]}])
    end
  end

  def update
    list = List.find(params[:id])

    if list.update(list_params)
      render json: list.to_json(only: [:name],include: [tasks: {only: [:name, :completed]}])
    end

  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    render json: List.all.to_json(only: [:name],
                                include: [tasks: {only: [:name, :completed]}])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end

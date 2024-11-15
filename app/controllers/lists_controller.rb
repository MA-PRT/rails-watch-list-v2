class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @list.update(params_list)
    redirect_to list_path(@list)

  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end

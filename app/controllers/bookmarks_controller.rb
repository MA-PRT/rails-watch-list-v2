class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create destroy]

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:movie_id, :comment)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end

class BookmarksController < ApplicationController

  before_filter :authorize

  def new
    @bookmark = Bookmark.new
    @user = User.all
  end

  def create
    @bookmark = Bookmark.new bookmark_params
      if @bookmark.save
          redirect_to root_path
      end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update
    @bookmark.save
    redirect_to root_path
  end

  def destroy
    @bookmark = Bookmark.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end

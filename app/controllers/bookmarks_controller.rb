class BookmarksController < ApplicationController

  before_filter :authorize

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new bookmark_params
    @bookmark.user_id = @current_user.id
    @bookmark.save
    redirect_to @current_user
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update_attributes(bookmark_params)
    redirect_to @current_user
  end

  def destroy
    @bookmark = Bookmark.find(params[:id]).destroy
    redirect_to @current_user
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :name)
  end
end

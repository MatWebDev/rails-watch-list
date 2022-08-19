class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    list = List.find(params[:list_id])
    movie = Movie.find(params[:bookmark][:movie])
    comment = params[:bookmark][:comment]
    @bookmark = Bookmark.new(comment: comment, movie: movie, list: list)
    @bookmark.save
    redirect_to list_path(list)
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:id])
    list = List.find(@bookmark.list_id)
    @bookmark.destroy
    redirect_to list_path(list), status: :see_other
  end

  # private

  # def bookmark_params
  #   params.require(:bookmark).permit(:comment, :movie, :list)
  # end
end

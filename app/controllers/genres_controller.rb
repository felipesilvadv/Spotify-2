class GenresController < ApplicationController
  before_action :set_genre,  only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
    @songs = Song.where(genre_id: @genre.id)
    @albums = Album.where(genre_id: @genre.id)
    @artists = Artist.where(genre_id: @genre.id)
    @favorites = Favorite.where(:user_id => current_user.id)
  end



private
    # Use callbacks to share common setup or constraints between actions.
  def set_genre
    @genre = Genre.find(params[:id])
  end
end

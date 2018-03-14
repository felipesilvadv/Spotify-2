class FavoritesController < ApplicationController
  before_action :set_song, only: [:index, :show, :edit, :update, :destroy]

  def index
    @favorites = Favorite.where(:user_id => current_user.id)
    #@songs = {}
    #@favorites.each do |fav|
      #@songs.update(Song.find(fav.song_id))
    #end
  end

  def show
  end

  def new
    @song = Song.find(params[:format])
    @user = current_user
    fav_params = {}
    fav_params[:user_id] = @user.id
    fav_params[:song_id] = @song.id
    @fav = Favorite.new fav_params
    if @fav.save
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
      #redirect_to songs_path, notice: 'Favorite added'
    else
      #redirect_to songs_path
      session[:return_to] ||= request.referer
      redirect_to session.delete(:return_to)
    end


  end

  # GET /songs/1/edit
  def edit
  end

  def create
    fav_params[:user_id] = current_user.id
    @favorite = Favorite.new fav_params

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to songs_path, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    puts params
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    session[:return_to] ||= request.referer
    respond_to do |format|
      format.html { redirect_to session.delete(:return_to), notice: 'Favorite was successfully errased.' }
      format.json { head :no_content }
    end
  end

  private
  def set_song
    #@song = Song.find(params[:id])
  end

  def fav_params
    params.require(:favorite).permit(:user_id, :song_id)
  end
end

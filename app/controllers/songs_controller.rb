require 'api_consuming'
class SongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_song, only: [:show, :edit, :update, :destroy, :add_favorite]

  # GET /songs
  # GET /songs.json
  def index
    @favorites = Favorite.where(:user_id => current_user.id)
    if params[:format]
      @songs = Song.where(:genre_id => params[:format])
    else
      @songs = Song.all
    end
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
    @video = api_consum "https://www.youtube.com/results?sp=EgIQAQ%253D%253D&search_query=#{@song.name}+#{@song.artist.name}"
    indice = @video.index('watch?v=')
    @video = @video[indice+8..-1]
    new_index = @video.index('"')
    @video_id = @video[0..new_index-1]
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
  #  puts 'holas'
  #  puts song_params
 #   puts 'hola'
 #   puts song_params
 #   puts 'hola'
 #   puts song_params[:al]
  #  puts song_params[:ar]
   # puts 'hola'
    song_params2 = {}
    song_params.each do |key, value|
      song_params2[key] = value if key != :genre or key != :artist or key != :album
    end
    song_params2[:genre]= Genre.find(song_params[:genre])
    song_params2[:album]= Album.find(Integer(song_params[:album]))
    song_params2[:artist]= Album.find(Integer(song_params[:album])).artist

    @song = Song.new(song_params2)
    @song.user = current_user
    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy

    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_favorite
    Favorite.create user_id: current_user.id, song_id: @song.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:name, :lyrics, :duration, :genre, :artist, :album, :image)
    end
end

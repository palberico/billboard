class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
def index
    @songs = Song.all
  end

  def show
    # @songs = Song.find(params[:id]) used in before_action
  end

  def update 
    if @songs.update(song_params)
      redirect_to artist_songs_path
    else 
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to artist_songs_path
    else
      render :new
    end
  end

  def edit
     # @songs = Song.find(params[:id]) used in before_action
  end 

  def destroy 
    # @songs = Song.find(params[:id]) used in before_action
    @songs.destroy
    redirect_to artist_songs_path
  end
  
  private

    def song_params
      params.require(:song).permit(:name, :duration, :genre, :album)
    end 

    def set_song
      @songs = Song.find(params[:id])
    end
end

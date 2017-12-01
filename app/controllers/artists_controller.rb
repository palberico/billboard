class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  
def index
    @artists = Artist.all
  end

  def show
    # @artists = Artist.find(params[:id]) used in before_action
  end

  def update 
    if @artists.update(artist_params)
      redirect_to artists_path
    else 
      render :edit
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
     # @artists = Artist.find(params[:id]) used in before_action
  end 

  def destroy 
    # @artists = Artist.find(params[:id]) used in before_action
    @artists.destroy
    redirect_to artists_path
  end
  
  private

    def artist_params
      params.require(:artist).permit(:name)
    end 

    def set_artist
      @artists = Artist.find(params[:id])
    end
end

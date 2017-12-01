class BillboardsController < ApplicationController
before_action :set_billboard, only: [:show, :edit, :update, :destroy]
  
def index
    @billboards = Billboard.all
  end

  def show
    # @billboards = Billboard.find(params[:id]) used in before_action
  end

  def update 
    if @billboards.update(billboard_params)
      redirect_to billboards_path
    else 
      render :edit
    end
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def edit
     # @billboards = Billboard.find(params[:id]) used in before_action
  end 

  def destroy 
    # @billboards = Billboard.find(params[:id]) used in before_action
    @billboards.destroy
    redirect_to billboards_path
  end
  
  private

    def billboard_params
      params.require(:billboard).permit(:title, :rank)
    end 

    def set_billboard
      @billboards = Billboard.find(params[:id])
    end
end
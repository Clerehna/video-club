class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def new
    @director = Director.new
  end

  def show
    @director = Director.find(params[:id])
  end

  def create
    @director = Director.new(director_params)
    @director.save

    redirect_to director_path(@director)
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    @director.update(director_params)

    redirect_to director_path(@director)
  end

  def destroy
    @director = Director.find(params[:id])
    @director.destroy

    redirect_to directors_path(@director)
  end

  private

  def director_params
    params.require(:director).permit(:name)
  end
end

class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @places = Place.all
    respond_with(@places)
  end

  def show
    @hash = Gmaps4rails.build_markers(@place) do |place, marker|
      marker.lat place.location[0]
      marker.lng place.location[1]
    end
    respond_with(@place)
  end

  def new
    @place = Place.new
    respond_with(@place)
  end

  def edit
  end

  def create
    data = place_params
    #data[:location] = data[:location].split(",")
    @place = Place.new(data)
    @place.save
    respond_with(@place)
  end

  def update
    data = place_params
    #data[:location] = data[:location].split(",")
    @place.update(data)
    respond_with(@place)
  end

  def destroy
    @place.destroy
    respond_with(@place)
  end

  private
    def set_place
      @place = Place.find(params[:id])
    end

    def place_params
      params.require(:place).permit(:title, :description, :status, :location)
    end
end

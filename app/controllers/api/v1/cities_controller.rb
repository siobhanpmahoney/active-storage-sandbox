class Api::V1::CitiesController < ApplicationController

  def index
    @cities = City.all
    render json: @cities, status: :ok
  end

  def show
    @city = City.find(params[:id])
    render json: @city, status: :ok
  end

  private

  def city_params
    params.require(:city).permit(:name, :state, pictures: [])
  end
end

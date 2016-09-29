class Api::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.filtered(*filter_params)
    render :index
  end

  def show
    @restaurant = Bench.find(params[:id])
    render :show
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:description, :lat, :lng)
  end

  def filter_params
    [params[:bounds], params[:minGrade], params[:maxGrade]]
  end
end

class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @users = User.where(city_id: @city.id)
    @gossips = Gossip.where(user_id: @users)
  end
end

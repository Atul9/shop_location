class LocationsController < ApplicationController
  def index
    @shops = Shop.all
    @hash = Gmaps4rails.build_markers(@shops) do |shop, marker|
        marker.lat shop.latitude
        marker.lng shop.longitude
    end
  end
end

class ShopsController < ApplicationController
  def new
    @shop = Shop.new
    @shop.pictures.build
  end
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = 'Shop Registered'
      redirect_to root_path
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :address, :latitude, :longitude, :description, pictures_attributes: :shop_image)
  end
end

class MapsController < ApplicationController
  def index
    @shop = Shop.find(params[:shop_id])
  end
end

class MenusController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @menus = Menu.where(shop_id: params[:shop_id])
  end
end

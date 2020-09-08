class MenusController < ApplicationController

  def index
    @menus = Menu.where(shop_id: params[:shop_id])
  end
end

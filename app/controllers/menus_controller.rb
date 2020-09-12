class MenusController < ApplicationController

  def index
    @shop = Shop.find(params[:shop_id])
    @menu = Menu.new
    @menus = Menu.where(shop_id: params[:shop_id])
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to shop_menus_path
    end
  end
    
  def destroy
    @menu = Menu.find(params[:id])
    @shop = @menu.shop
    @menu.destroy
    redirect_to shop_menus_path(@shop.id)

  end

  private
  def menu_params
    params.require(:menu).permit(:name, :price).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end

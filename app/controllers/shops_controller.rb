class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def search
    @shops = Shop.search(params[:keyword])
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :genre, :area)
  end
end

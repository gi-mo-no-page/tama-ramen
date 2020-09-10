class ShopsController < ApplicationController
  before_action :search_shop, only: [:index, :search]

  def index
    @shops = Shop.all
    @user = current_user
    set_shop_column
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
    @shop =Shop.find(params[:id])
  end

  def search
    @results = @p.result
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :text, :genre, :address, :image)
  end

  def search_shop
    @p = Shop.ransack(params[:q])
  end

  def set_shop_column
    @shop_genre = Shop.select("genre").distinct 
     
  end


end

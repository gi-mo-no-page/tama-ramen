class GoodsController < ApplicationController

  def index
    @user = current_user
    @goods = @user.goods.includes(:shop)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    good = Good.new(
      user_id: current_user.id,
      shop_id: @shop.id
    )
    good.save
    redirect_to shop_path(@shop.id)
  end

  def destroy
    @shop = Shop.find(params[:id])
    good = Good.find_by(
      user_id: current_user.id,
      shop_id: @shop.id
    )
    good.destroy
    redirect_to shop_path(@shop.id)

  end

end

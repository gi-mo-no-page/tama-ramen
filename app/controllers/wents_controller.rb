class WentsController < ApplicationController
  def index
    @user = current_user
    @wents = @user.wents.includes(:shop).page(params[:page]).per(5)
  end

  def create
    @shop = Shop.find(params[:shop_id])
    went = Went.new(
      user_id: current_user.id,
      shop_id: @shop.id
    )
    went.save
    redirect_to shop_path(@shop.id)
  end

  def destroy
    @shop = Shop.find(params[:id])
    went = Went.find_by(
      user_id: current_user.id,
      shop_id: @shop.id
    )
    went.destroy
    redirect_to shop_path(@shop.id)
  end

end

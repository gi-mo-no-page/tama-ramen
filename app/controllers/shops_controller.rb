class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :show, :destroy]

  def index
    @shops = Shop.all.order(created_at: :desc).limit(5)
    @user = current_user
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.valid?
      @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @menus = @shop.menus.includes(:user)
    @reviews = @shop.reviews.includes(:user)
  end


  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    if @shop.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @results = @p.result.includes(:category).order(created_at: :desc).page(params[:page]).per(6)
  end

  def replay
    return nil if params[:keyword] == ''

    @name = Shop.where('name LIKE(?)', "%#{params[:keyword]}%")
    render json: @name
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :text, :address, :image, :category_id).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end

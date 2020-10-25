class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :show, :destroy]

  def index
    @shops = Shop.all.order(created_at: :desc).limit(5)
    @categories = Category.all
    @user = current_user
    set_areas
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
    @results = @p.result.includes(:category, :reviews).order(created_at: :desc).page(params[:page]).per(5)
    @show_results = @p.result.includes(:category, :reviews)
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

  def set_areas
    @north_tama_areas = %w[西東京市 東久留米市 清瀬市 東村山市 小平市 東大和市 武蔵村山市]
    @south_tama_areas = %w[多摩市 町田市 稲城市 日野市 八王子 府中市]
    @west_tama_areas = %w[昭島市 立川市 福生市 羽村市 青梅市 あきる野市 瑞穂町]
    @east_tama_areas = %w[小金井市 国立市 国分寺市 三鷹市 武蔵野市 調布市 狛江市]
  end
end

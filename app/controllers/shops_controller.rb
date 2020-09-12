class ShopsController < ApplicationController

  def index
    @shops = Shop.all.order(created_at: :desc).page(params[:page]).per(5)
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
    @shop =Shop.find(params[:id])
  end

  def edit 
    @shop =Shop.find(params[:id])
  end

  def update 
    @shop =Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy 
    @shop =Shop.find(params[:id])
    if @shop.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  def search
    @results = @p.result.includes(:category).order(created_at: :desc).page(params[:page]).per(5)
  end


  private
  def shop_params
    params.require(:shop).permit(:name, :text, :address, :image,:category_id).merge(user_id: current_user.id)
  end

end

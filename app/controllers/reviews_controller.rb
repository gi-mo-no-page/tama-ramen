class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:edit, :update, :destroy]

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = @shop.reviews.includes(:user)
  end

  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to shop_path(@review.shop.id)
    else
      render :new
    end
  end

  def edit
    @shop = @review.shop
  end

  def update
    if @review.update(edit_params)
      redirect_to shop_path(@review.shop.id)
    else
      render :edit
    end
  end

  def destroy
    @shop = @review.shop
    if @review.destroy
      redirect_to shop_path(@shop.id)
    else
      render :show
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :text, :rate).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

  def edit_params
    params.require(:review).permit(:id, :title, :text, :rate)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end

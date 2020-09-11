class ReviewsController < ApplicationController
  before_action :authenticate_user!

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
    if  @review.save
      redirect_to shop_reviews_path
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @shop = @review.shop
    if @review.update(edit_params)
      redirect_to shop_reviews_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @shop = @review.shop
    if @review.destroy
      redirect_to shop_reviews_path(@shop.id)
    else
      render :show
    end


  end

  
  private
  def review_params
    params.require(:review).permit(:title, :text, :rate).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
  def edit_params
    params.require(:review).permit(:title, :text, :rate)
  end



end

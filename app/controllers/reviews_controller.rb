class ReviewsController < ApplicationController

  def index
    @review = Review.find(params[:shop_id])
    @shop = Shop.find(params[:shop_id])
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
  end

  def update
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:title, :text, :rate).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end

end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_shop
  before_action :set_shop_column
  before_action :set_category_column

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def search_shop
    @p = Shop.ransack(params[:q])
  end

  def set_shop_column
    @shop_address = Shop.select('address').distinct
  end

  def set_category_column
    @category_name = Category.select('name').distinct
  end

  def set_review_column
    @review_rate = Review.select('rate').distinct
  end
end

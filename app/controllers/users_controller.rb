class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def show
    @reviews = @user.reviews.includes(:shop)
    @goods = @user.goods.includes(:shop)
    @wents = @user.wents.includes(:shop)
    @shops = @user.shops
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :avatar, :text)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

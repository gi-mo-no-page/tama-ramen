class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:shop)
  end

  def edit
    @user = User.find(params[:id])
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

end

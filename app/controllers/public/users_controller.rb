class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :unsubscribe]
  before_action :set_user, only: [:show]

  def show
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to mypage_path
    end
  end

  def mypage
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.email == "guest@example.com"
      redirect_to mypage, alert: "ゲストユーザは更新できません。"
    else
      user.update(user_params)
      redirect_to mypage_path
    end
  end

  def unsubscribe
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      redirect_to root_path
    else
      redirect_to mypage_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end

class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :edit, :update, :unsubscribe] #未ログインユーザのアクセス制限
  before_action :set_user, only: [:show] #ユーザページの表示はログイン不要

  def show
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to mypage_path
    end
  end
  
  # マイページ専用
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
      redirect_to mypage_path, notice: "ユーザー情報を更新しました。"
    end
  end
  
  # 退会画面
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

  # ユーザページを表示
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end

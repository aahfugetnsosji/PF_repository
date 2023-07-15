class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show] #未ログインユーザのアクセス制限

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(15)
    if @user == current_user
      redirect_to mypage_path
    end
  end

  # マイページ専用
  def mypage
    @user = current_user
    @posts = current_user.posts.page(params[:page]).per(15)
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.email == "guest@example.com"
      redirect_to mypage_path, alert: "ゲストユーザは更新できません。"
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

  # ブックマーク一覧
  def favorite
    @favorites = current_user.favorites.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile, :profile_image)
  end
end

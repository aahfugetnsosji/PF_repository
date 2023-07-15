class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to admin_user_path(@user.id), alert: "ゲストユーザーは削除できません。"
    elsif @user.email != "guest@example.com"
      @user.destroy
      redirect_to admin_users_path, notice: "退会処理が完了しました。"
    else
      render :show, alert: "退会処理が完了できませんでした。"
    end
  end
end

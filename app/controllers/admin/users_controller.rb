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
      flash[:alert] = "ゲストユーザーは削除できません。"
      redirect_to admin_user_path(@user.id)
    elsif @user.email != "guest@example.com"
      @user.destroy
      flash[:notice] = "退会処理が完了しました。"
      redirect_to admin_users_path
    else
      @user = User.find(params[:id])
      @posts = @user.posts.page(params[:page]).per(10)
      flash[:alert] = "退会処理が完了できませんでした。"
      render :show
    end
  end
end

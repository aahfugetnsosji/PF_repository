class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to admin_users_path, alert: "ゲストユーザーは削除できません。"
    else
      @user.destroy
      redirect_to admin_user_path(@user.id), notice: "退会処理が完了しました。"
    end
  end
end

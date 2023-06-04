class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #新規登録時にnameの値を受け取る
  before_action :ensure_normal_user, only: :destroy, if: -> { controller_name == "registrations" } #ゲストユーザの削除制限用

  protected

# 新規登録時にnameの値を受け取る
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

# ゲストユーザの削除制限
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
end

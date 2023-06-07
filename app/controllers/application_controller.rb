class ApplicationController < ActionController::Base
  # 新規登録時にnameの値を受け取る
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ゲストユーザアカウントの削除制限
  before_action :ensure_normal_user, only: :destroy, if: -> { controller_name == "registrations" }
  # 管理者用ページへのアクセス制限
  before_action :authenticate_admin!, if: :admin_url

  protected
    # 管理者用ページの定義(アクセス制限用)
    def admin_url
      request.fullpath.include?("/admin")
    end
    
    # ログイン後の遷移先
    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
        root_path #あとで通報一覧ページに変更
      else
        root_path
      end
    end
    
    # ログアウト後の遷移先
    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
        new_admin_session_path
      elsif resource_or_scope == :public
        root_path
      else
        root_path
      end
    end
    
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

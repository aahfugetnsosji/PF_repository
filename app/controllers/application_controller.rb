class ApplicationController < ActionController::Base
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
        admin_root_path
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

    # ゲストユーザの削除制限
    def ensure_normal_user
      if resource.email == 'guest@example.com'
        redirect_to mypage_path, alert: 'ゲストユーザーは削除できません。'
      end
    end
end

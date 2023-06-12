Rails.application.routes.draw do
  
  # ユーザー用devise
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  # 管理者用devise
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  # ユーザ側ルーティング
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    # マイページ・ユーザーページ用
    resources :users, only: [:show, :update, :destroy]
    get 'mypage' => "users#mypage"
    get 'mypage/edit' => "users#edit"
    get 'unsubscribe' => "users#unsubscribe"
    # 地方区分絞り込み用
    resources :regions, only: [:index]
    # 投稿
    resources :posts do
      # コメント用
      resources :post_comments, only: [:create, :destroy]
    end
    # キーワード検索用
    get 'search' => "posts#search"
    # 都道府県絞り込み用
    resources :prefectures, only: [:index]
    # タグ検索用
    resources :tags, only: [:index]
    # 通報用
    resources :reports, only: [:new, :create]
  end
  
  # 管理者側ルーティング
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :tags, except: [:show, :new]
    resources :reports, only: [:show, :update]
  end
  
end

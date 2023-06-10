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
    # 投稿に関するページを表示するためのルーティング
    resources :posts, except: [:create, :update, :destroy]
    # 地方区分絞り込み用。なお投稿の作成・編集・削除はregions_controllerで行う
    resources :regions, only: [:index, :create, :update, :destroy]
    # 都道府県絞り込み機能用
    resources :prefectures, only: [:index]
    # タグ検索用
    resources :tags, only: [:index]
    # コメント用
    resources :post_comments, only: [:create, :destroy]
    # 通報用
    resources :reports, only: [:new, :create]
  end
  
  # 管理者側ルーティング
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show]
    resources :tags, except: [:show, :new]
    resources :regions, only: [:destroy]
    resources :post_comments, only: [:destroy]
    resources :reports, only: [:show, :update]
  end
  
end

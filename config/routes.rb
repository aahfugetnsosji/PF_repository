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
  
  # ユーザ用
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    # マイページ・ユーザーページ用
    resources :users, only: [:show, :update, :destroy]
    get 'mypage' => "users#mypage"
    get 'mypage/edit' => "users#edit"
    get 'unsubscribe' => "users#unsubscribe"
    # 投稿
    resources :posts, except: [:create, :update]
    resources :regions, only: [:index, :create, :update]
    resources :prefectures, only: [:index]
    resources :tags, only: [:index]
  end
  
  # 管理者用
  namespace :admin do
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :tags, except: [:show, :new]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

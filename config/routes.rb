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
  
  # ユーザ用
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
  end
  
  # 管理者用
  namespace :admin do
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

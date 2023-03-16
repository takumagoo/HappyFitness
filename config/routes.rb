Rails.application.routes.draw do
  # 顧客
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 顧客ゲストログイン
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'  #ゲストログインurl
  end

  # 管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"

  }

  namespace :admin do
    root to: "homes#top"
  
    patch '/customers/withdraw' => 'customers#withdraw'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]
    resources :menus, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: "homes#top"
    get 'customers/member' => 'customers#member'
    get '/customers/my_page' => 'customers#show'
    resources :customers, only: [:edit, :update]
    resources :genres, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

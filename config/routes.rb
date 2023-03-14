Rails.application.routes.draw do
  namespace :admin do
    get 'menus/index'
    get 'menus/new'
    get 'menus/show'
    get 'menus/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :public do
    get 'genres/index'
    get 'genres/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'homes/top'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

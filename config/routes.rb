Rails.application.routes.draw do
  
  root to: 'public/homes#top'
      
  ##顧客
  namespace :public do
    resources :addresses, only: [:index, :edit, :update]

    get 'orders/complete'
    resources :orders, only: [:new, :index, :show]

    get '/cart_items' => 'cart_items#index'

    get 'customers/out_confirmation'
    patch 'customers/out_update'
    resources :customers, only: [:show, :edit, :update]

    resources :items, only: [:index, :show]

    get '/about' => 'homes#about'
  end
  
  ##管理者
  namespace :admin do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    get '/' => 'homes#top' 
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

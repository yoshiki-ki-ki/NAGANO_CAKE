Rails.application.routes.draw do

  root to: 'public/homes#top'

  ##顧客
  namespace :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    get 'orders/complete'
    post 'orders/order_confirmation'
    resources :orders, only: [:new, :create, :index, :show]

    delete 'cart_items/all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy]

    get 'customers/out_confirmation'
    patch 'customers/out_update'
    resources :customers, only: [:show, :edit, :update]

    resources :items, only: [:index, :show]

    get '/about' => 'homes#about'
  end

  ##管理者
  namespace :admin do
   # patch 'orders/orders_update/id'
    patch 'orders/orders_update/:id' => 'orders#orders_update', as: 'orders_orders_update'
    patch 'orders/production_update/:id' => 'orders#production_update', as: 'orders_production_update'

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

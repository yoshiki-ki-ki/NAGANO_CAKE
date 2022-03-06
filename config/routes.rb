Rails.application.routes.draw do
  ##顧客
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'

    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'

    get 'cart_items/index'

    get 'customers/show'
    get 'customers/edit'
    get 'customers/out_confirmation'

    get 'items/index'
    get 'items/show'

    get 'homes/top'
    get 'homes/about'
  end
  
  ##管理者
  namespace :admin do
    get 'orders/show'
 
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    
    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    get '/items' => 'items#index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
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

Rails.application.routes.draw do
  devise_for :users
  
  root "products#index" 

  resources :products, only: [:index, :show] do
    member do
      post :add_product_to_cart
      post :remove_from_cart
      post :adjust_item
    end
  end

  resource :cart
  resources :orders, only: [:create, :show, :update]


  namespace :admin do
    root "products#index"
    resources :products
    resources :orders, only: [:index, :show, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

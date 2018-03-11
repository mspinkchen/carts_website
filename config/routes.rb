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

  namespace :admin do
    root "products#index"
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

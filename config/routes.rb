Rails.application.routes.draw do
  devise_for :users
  
  root "products#index" 

  resources :products, only: [:index, :show] do
    member do
      post :add_product_to_cart
    end

    collection do
      get :cart
    end
  end

  namespace :admin do
    root "products#index"
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root "products#index"
  resources :user, only: [:show, :edit, :update]
  namespace :admin do
    root "products#index"
    resources :products
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

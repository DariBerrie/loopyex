Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :orders, only: %i[ index show ]
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :orders, only: %i[ index show new create ]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

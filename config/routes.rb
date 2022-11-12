Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  get 'pages/about', to: "pages#about"

  devise_for :users
  resources :users do
    resources :orders, only: %i[ index show ]
  end

  resources :products do
    resources :orders, only: %i[ index show new create ]
  end
end

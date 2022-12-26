Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  get 'pages/about', to: "pages#about"

  devise_for :users
  resources :users do
    resources :orders, only: %i[index show]
  end

  resources :products

  resources :orders, only: %i[index show create] do
    resources :payments, only: :new
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'
end

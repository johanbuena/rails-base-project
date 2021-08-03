Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
  get '/buy/:sym', to: 'portfolios#buy', as: 'buy'

  get '/admin', to: "admin#index"
  get '/admin/new', to: "admin#new"
  post '/admin/new', to: "admin#create"
  get  '/admin/:id', to: "admin#edit"
  put '/admin/:id', to: "admin#update"
  post '/admin/:id', to: "admin#approve"
  

  resources :transactions
  resources :portfolios
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
<<<<<<< HEAD

  resources :admin
=======
  resources :transactions
  resources :portfolios
>>>>>>> 97554ff7b6c611b1f7c48181a69f3be792571edb
end

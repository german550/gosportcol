Rails.application.routes.draw do
  devise_for :users
  resources :pages
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "bse#index"
end

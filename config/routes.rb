Rails.application.routes.draw do
  devise_for :users
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "events#index"
  resources :my_events
  resources :about
  resources :events do
    resources :registrations do
      put "unregister"
    end
  end
end

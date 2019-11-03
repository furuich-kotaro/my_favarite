Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'
  resources :posts
  resources :maps, only: [:index]
end

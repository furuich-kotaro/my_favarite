Rails.application.routes.draw do
  get 'maps/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'
  resources :posts, except: [:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
  end
  resources :maps, only: [:index]
end

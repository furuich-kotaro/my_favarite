Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'
  resources :posts, except: [:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
  end
  get 'search', to: 'posts#search'
  resources :maps, only: [:index]
end

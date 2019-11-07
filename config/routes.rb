Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show] do
    member do
      get 'search', to: 'users#search'
    end
  end
  resources :posts, except: [:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search', to: 'posts#search'
    end
  end
  resources :maps, only: [:index]
end

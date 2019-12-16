Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show] do
    member do
      get 'search',        to: 'users#search'
      put 'follow',        to: 'users#follow'
      put 'unfollow',      to: 'users#unfollow'
      get 'follow_list',   to: 'users#follow_list'
      get 'follower_list', to: 'users#follower_list'
    end
  end
  resources :posts, except: [:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search', to: 'posts#search'
    end
  end
  resources :maps, only: [:index] do
    collection do
      get 'search', to: 'maps#search'
    end
  end
end

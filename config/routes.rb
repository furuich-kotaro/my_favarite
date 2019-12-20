Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show] do
    member do
      get 'search',            to: 'users#search'
      put 'follow',            to: 'users#follow'
      put 'unfollow',          to: 'users#unfollow'
      get 'follow_list',       to: 'users#follow_list'
      get 'follower_list',     to: 'users#follower_list'
      get 'likes/list',        to: 'likes#index'
      get 'likes/list/search', to: 'likes#search'
    end
  end
  resources :posts, except: %i[show edit update] do
    resources :likes, only: %i[create destroy]
    collection do
      get 'search', to: 'posts#search'
    end
  end
  resources :maps, only: [:index] do
    collection do
      get 'search', to: 'maps#search'
    end
  end
  get   'notifications', to: 'notifications#index'
  patch 'notifications', to: 'notifications#update'
end

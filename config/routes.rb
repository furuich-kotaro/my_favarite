Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'posts#index'
  resources :posts, except: [:show, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search', to: 'posts#search'
    end
  end
  resources :maps, only: [:index]
end

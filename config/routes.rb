Rails.application.routes.draw do
  root to: 'site/homes#index'
  namespace :site do
    get 'homes/index'
    get 'homes/about'
    resources :posts, only: %i[show] do
      get :search, on: :collection
    end
    resources :comments, only: %i[create]
  end
  namespace :dashboard do
    get 'posts/inactive', to: "posts#inactive"
    resources :comments, only: %i[create]
    resources :posts
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

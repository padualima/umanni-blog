Rails.application.routes.draw do
  root to: 'site/homes#index'
  namespace :site do
    get 'homes/index'
    resources :posts, only: %i[show]
    resources :comments, only: %i[create]
  end
  namespace :dashboard do
    get 'posts/inactive', to: "posts#inactive"
    get 'homes/index'
    resources :posts
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

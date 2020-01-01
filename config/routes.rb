Rails.application.routes.draw do
  namespace :dashboard do
    resources :posts
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

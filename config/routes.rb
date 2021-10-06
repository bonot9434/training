Rails.application.routes.draw do
  resources :information
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users
  resources :tweets do
    resource :likes, only: [:create, :destroy]
  end
end

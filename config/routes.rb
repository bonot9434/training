Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  resources :users
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
  end
end

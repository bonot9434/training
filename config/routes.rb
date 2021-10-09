Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  resources :users do
    member do
      get :likes
    end
  end
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end

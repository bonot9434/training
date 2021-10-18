Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'
  get "users_content" => "homes#users_content"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
    get "followings_search" => "relationships#followings_search"
    get "followers_search" => "relationships#followers_search"
  end
  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :notifications, only: [:index, :destroy]

  get "users/:id/likes" => "users#likes"
  get "search" => "searches#search"
  get "search_tag" => "searches#search_tag"
  get "map" => "maps#map"
  get "map_show" => "maps#map_show"
end

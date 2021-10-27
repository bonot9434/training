Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'homes#top'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
    get "followings_search" => "searches#followings_search", as: "followings_search"
    get "followers_search" => "searches#followers_search", as: "followers_search"
  end

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end

  resources :notifications, only: [:index, :destroy]

  resources :rooms
  resources :messages

  get "users/:id/likes" => "users#likes"
  get "user_search" => "searches#user_search"
  get "search_tag" => "searches#search_tag"
  get "map" => "maps#map"
  get "map_show" => "maps#map_show"
  get "industry" => "industries#industry"
  get "industry_show" => "industries#industry_show"
end

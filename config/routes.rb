# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'home#index'

  resources :posts do
    resources :post_comments, controller: 'comments'
    resources :post_likes, controller: 'likes'
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: %i[index show new create] do
    scope module: :posts do
      resources :comments, only: :create
      resources :likes, only: %i[create destroy]
    end
  end

  match '/404', via: :all, to: 'errors#not_found'
  match '/422', via: :all, to: 'errors#unprocessable_entity'
  match '/500', via: :all, to: 'errors#server_error'
end

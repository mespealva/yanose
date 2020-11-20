# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  # resources :comments
  root to: 'posts#index'

  # resources :posts

  devise_for :users
  resources :users
end

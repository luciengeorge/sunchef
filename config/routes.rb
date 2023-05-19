# frozen_string_literal: true

Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    namespace :admin do
      resources :users
      resources :recipes do
        delete :images, on: :member, action: :destroy_image
      end
      resources :categories
      resources :ingredients
      resources :instructions
      resources :testimonials
      resources :selling_points

      root to: "users#index"
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get :about, to: "pages#about"
  get :cook, to: "pages#cook"
  get :shop, to: "pages#shop"
  get :coaching, to: "pages#coaching"

  resources :testimonials, only: :index
  resources :recipes, only: [:index, :show]
end

# frozen_string_literal: true

Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => "/sidekiq"
    namespace :admin do
      resources :recipes do
        delete :images, on: :member, action: :destroy_image
      end
      resources :users
      resources :ingredients
      resources :instructions
      resources :testimonials
      resources :contacts
      resources :plans
      resources :carousel_images
      resources :selling_points

      root to: "recipes#index"
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
  get :maintenance, to: "pages#maintenance"

  resources :recipes, only: [:index, :show]
  resources :contacts, only: [:index, :show, :new, :create], path: "forms" do
    get :thank_you, on: :collection
  end
  resources :users, only: [] do
    post :lock, on: :collection
  end
end

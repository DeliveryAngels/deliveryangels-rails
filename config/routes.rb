# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }

  devise_for :angels, controllers: {
    registrations: "angels/registrations",
  }

  resources :orders do
    get "review"
    get "delivery"
    get "pending"
  end

  resources :order_items, only: [:update]
  resources :addresses
  resources :deliveries

  get "profile", action: :show, controller: "users"
  root to: "pages#home"
  resources :groceries, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

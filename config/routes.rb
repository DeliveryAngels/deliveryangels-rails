Rails.application.routes.draw do

  resources :orders do
  	get 'review'
  end	
  get 'profile', action: :show, controller: 'users'
  root to: 'pages#home'
  resources :groceries, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

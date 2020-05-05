Rails.application.routes.draw do


  Rails.application.routes.draw do
      devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    end

  resources :orders do
  	get 'review'
    get 'delivery'
    get 'pending'
  end

  resources :addresses

  get 'profile', action: :show, controller: 'users'
  root to: 'pages#home'
  resources :groceries, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

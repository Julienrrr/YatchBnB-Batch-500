Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only: [:new, :create, :edit, :update]
  end

  resources :bookings, only: [:index, :destroy] do
    member do 
      patch "update_status", to: "bookings#update_status"
    end
    resources :reviews, only: [:new, :create]
  end

  get "/dashboard", to: "dashboards#dashboard"
end

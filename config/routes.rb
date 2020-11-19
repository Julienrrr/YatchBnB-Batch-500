Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only: [:new, :create, :edit, :update]
  end

  resources :bookings, only: [:index, :destroy] do
    resources :reviews, only: [:new, :create]
  end
end

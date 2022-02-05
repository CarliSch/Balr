Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :matches, only: [:index, :show, :new, :create] do
    resources :match_users, only: [:create]
  end

  resources :user, only: [:show] do
    resource :profile, only: [:show]
  end
  resources :clubs, only: [:index, :show, :new, :create] do
    resources :club_requests, only: [:create]
  end

  resources :club_requests, only: [:update]


  resources :challenges, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end

# resources :creators do
 #   resources :tournaments do
  #    resources :tournament_requests, only: [:create]
   # end
 # end

  resources :creators do
    resources :tournaments
  end

  resources :tournaments do
    resources :tournament_requests, only: [:create]
  end

  resources :tournament_requests, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

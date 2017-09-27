Rails.application.routes.draw do

#landing page
  root 'home#index'

#short description explaining site's features
  get '/how-it-works', to: 'home#show'

#how we got here
  get '/about', to: 'home#new'

#callback after user has authorized strava and app to talk
  get '/oauth2/:provider/callback', to: 'sessions#create'

#where user lands after login process or having visited before
  get '/dashboard', to: 'users#show'

  patch '/add-shop', to: "users#update"
  # get '/search', to: 'shops#index'
  # resources :users, only: [:update, :show]

  delete '/logout', to: 'sessions#destroy'

  # resources :shops, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :shops, only: [:index]
      # resources :users, only: [:update]
    end
  end
end
